#!/bin/bash

# Hypz Original — Video Generator
# Interactive TUI — pick story, detect files, generate video
#
# Usage:
#   ./generate-video.sh              # Interactive mode (pick story)
#   ./generate-video.sh <story>      # Direct mode
#
# Expected in STORIES/<story>/:
#   thumbnail.*  — any format (jpg, png, webp, etc.)
#   audio.*      — any format (wav, mp3, m4a, etc.)
#
# Output:
#   STORIES/<story>/<story>.mp4

set -e

BASE_DIR="$(cd "$(dirname "$0")/STORIES" && pwd)"
SCRIPT_NAME="$(basename "$0")"

# ─── Status Legend ──────────────────────────────────────
# 🎨 = Has thumbnail   🔊 = Has audio   ✅ = Has video

# ─── Colors ──────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# ─── Detect FFmpeg ───────────────────────────────────────
if ! command -v ffmpeg &>/dev/null; then
    echo -e "${RED}❌ FFmpeg not found. Install it first:${NC}"
    echo "   sudo apt install ffmpeg"
    exit 1
fi

# ─── List stories ─────────────────────────────────────────
list_stories() {
    local stories=()
    for dir in "$BASE_DIR"/*/; do
        name="$(basename "$dir")"
        # Check if it has at least an image or audio
        img="$(ls "$dir"/thumbnail.* 2>/dev/null | head -1)"
        aud="$(ls "$dir"/audio.* 2>/dev/null | head -1)"
        vid="$(ls "$dir"/"$name".mp4 2>/dev/null | head -1)"
        status=""
        [ -n "$img" ] && status="${status}🖼" || status="${status}❌"
        [ -n "$aud" ] && status="${status}🔊" || status="${status}❌"
        [ -n "$vid" ] && status="${status}✅" || status="${status}⬜"
        stories+=("$name|$status")
    done
    echo "${stories[@]}"
}

# ─── Pick story (interactive menu) ──────────────────────
SELECTED_STORY=""

render_menu() {
    local items=("$@")
    clear
    echo -e "${BOLD}${CYAN}  ╔══════════════════════════════╗${NC}"
    echo -e "${BOLD}${CYAN}  ║   Hypz Original — Studio     ║${NC}"
    echo -e "${BOLD}${CYAN}  ║   Video Generator             ║${NC}"
    echo -e "${BOLD}${CYAN}  ╚══════════════════════════════╝${NC}"
    echo ""
    echo ""
    echo -e "${BOLD}📂 Stories${NC}"
    echo "────────────────────────"
    for i in "${!items[@]}"; do
        name="${items[$i]}"
        img="$(ls "$BASE_DIR/$name"/thumbnail.* 2>/dev/null | head -1)"
        aud="$(ls "$BASE_DIR/$name"/audio.* 2>/dev/null | head -1)"
        vid="$(ls "$BASE_DIR/$name"/"$name".mp4 2>/dev/null | head -1)"
        status=""
        [ -n "$img" ] && status="${status}🎨" || status="${status}⬜"
        [ -n "$aud" ] && status="${status}🔊" || status="${status}⬜"
        [ -n "$vid" ] && status="${status}✅" || status="${status}⬜"
        printf "  ${BOLD}%d.${NC} %s  %s\n" $((i+1)) "$name" "$status"
    done
    echo "────────────────────────"
    echo -e "  ${YELLOW}s${NC} search  ${YELLOW}q${NC} quit"
    echo "────────────────────────"
}

pick_story() {
    local items=()
    for dir in "$BASE_DIR"/*/; do
        items+=("$(basename "$dir")")
    done

    if [ ${#items[@]} -eq 0 ]; then
        echo -e "${RED}❌ No stories found in STORIES/${NC}"
        exit 1
    fi

    while true; do
        render_menu "${items[@]}"
        echo -ne "${CYAN}Select: ${NC}"
        read -r choice

        case "$choice" in
            q|Q) exit 0 ;;
            s|S) search_story "${items[@]}" ;;
            *)
                if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le "${#items[@]}" ]; then
                    SELECTED_STORY="${items[$((choice-1))]}"
                    return
                fi
                ;;
        esac
    done
}

# ─── Search stories ──────────────────────────────────────
search_story() {
    local all=("$@")
    echo -ne "${CYAN}Search (name): ${NC}"
    read -r query
    [ -z "$query" ] && return

    local matches=()
    for name in "${all[@]}"; do
        [[ "$name" == *"$query"* ]] && matches+=("$name")
    done

    if [ ${#matches[@]} -eq 0 ]; then
        echo -e "${RED}No matches for '$query'${NC}"
        sleep 1
        return
    fi

    if [ ${#matches[@]} -eq 1 ]; then
        SELECTED_STORY="${matches[0]}"
        return
    fi

    echo ""
    echo -e "${BOLD}Matches:${NC}"
    for i in "${!matches[@]}"; do
        printf "  %2d) %s\n" $((i+1)) "${matches[$i]}"
    done
    echo -ne "${CYAN}Select number: ${NC}"
    read -r sel
    if [[ "$sel" =~ ^[0-9]+$ ]] && [ "$sel" -ge 1 ] && [ "$sel" -le "${#matches[@]}" ]; then
        SELECTED_STORY="${matches[$((sel-1))]}"
    fi
}

# ─── Generate video ──────────────────────────────────────
generate() {
    local STORY_NAME="$1"
    local STORY_DIR="$BASE_DIR/$STORY_NAME"

    if [ ! -d "$STORY_DIR" ]; then
        echo -e "${RED}❌ Story folder not found: $STORY_DIR${NC}"
        exit 1
    fi

    # Find image — any format
    IMAGE_FILE=""
    for f in "$STORY_DIR"/thumbnail.*; do
        [ -f "$f" ] && IMAGE_FILE="$f" && break
    done

    if [ -z "$IMAGE_FILE" ]; then
        echo -e "${RED}❌ No thumbnail found in $STORY_DIR${NC}"
        echo "   Expected: thumbnail.jpg, thumbnail.png, thumbnail.webp, etc."
        exit 1
    fi

    # Find audio — any format
    AUDIO_FILE=""
    for f in "$STORY_DIR"/audio.*; do
        [ -f "$f" ] && AUDIO_FILE="$f" && break
    done

    if [ -z "$AUDIO_FILE" ]; then
        echo -e "${RED}❌ No audio file found in $STORY_DIR${NC}"
        echo "   Expected: audio.wav, audio.mp3, audio.m4a, etc."
        exit 1
    fi

    OUTPUT_FILE="$STORY_DIR/video.mp4"

    # ─── Validation ──────────────────────────────────────
    local PASS=0
    local FAIL=0
    local CHECKS=""

    [ -n "$IMAGE_FILE" ] && { PASS=$((PASS+1)); CHECKS="${CHECKS}  ✅ Thumbnail: $(basename "$IMAGE_FILE") ($(du -h "$IMAGE_FILE" | cut -f1))\n"; } || { FAIL=$((FAIL+1)); CHECKS="${CHECKS}  ❌ Thumbnail: missing\n"; }
    [ -n "$AUDIO_FILE" ] && { PASS=$((PASS+1)); CHECKS="${CHECKS}  ✅ Audio: $(basename "$AUDIO_FILE") ($(du -h "$AUDIO_FILE" | cut -f1))\n"; } || { FAIL=$((FAIL+1)); CHECKS="${CHECKS}  ❌ Audio: missing\n"; }
    
    DURATION=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$AUDIO_FILE" 2>/dev/null)
    if [ -n "$DURATION" ]; then
        DURATION_INT=$(printf "%.0f" "$DURATION" 2>/dev/null)
        local H=$((DURATION_INT/3600))
        local M=$(( (DURATION_INT%3600)/60 ))
        local S=$((DURATION_INT%60))
        CHECKS="${CHECKS}  ⏱  Duration: $(printf "%02d:%02d:%02d" $H $M $S)\n"
    else
        CHECKS="${CHECKS}  ⚠️  Duration: couldn't read\n"
    fi

    local VIDEO_EXISTS=0
    if [ -f "$OUTPUT_FILE" ]; then
        VIDEO_EXISTS=1
        local VID_SIZE=$(du -h "$OUTPUT_FILE" | cut -f1)
        CHECKS="${CHECKS}  ⚠️  Existing video: $(basename "$OUTPUT_FILE") ($VID_SIZE) — will be overwritten\n"
    fi

    echo ""
    echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "  ${CYAN}Hypz Original — Video Generator${NC}"
    echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "  ${YELLOW}Story:${NC}   $STORY_NAME"
    echo -e ""
    echo -e "$CHECKS"
    echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

    if [ $FAIL -gt 0 ]; then
        echo -e "${RED}❌ $FAIL file(s) missing. Cannot generate.${NC}"
        exit 1
    fi

    if [ $VIDEO_EXISTS -eq 1 ]; then
        echo -ne "${YELLOW}⚠️  video.mp4 already exists. Overwrite? (y/N): ${NC}"
        read -r overwrite
        if [[ ! "$overwrite" =~ ^[yY] ]]; then
            echo "❌ Cancelled."
            exit 0
        fi
    else
        echo -ne "${CYAN}Generate video? (Y/n): ${NC}"
        read -r confirm
        if [[ "$confirm" =~ ^[nN] ]]; then
            echo "❌ Cancelled."
            exit 0
        fi
    fi

    echo -e "${YELLOW}Generating video...${NC}"

    # Re-read audio duration (validation already did this, but keep for safety)
    DURATION=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$AUDIO_FILE" 2>/dev/null)
    [ -z "$DURATION" ] && { echo -e "${RED}❌ Could not read audio duration${NC}"; exit 1; }
    DURATION_INT=$(printf "%.0f" "$DURATION" 2>/dev/null)

    # Step 1: Resize image to 1280x720
    TMP_IMAGE="/tmp/hypz_${STORY_NAME}_resized.png"
    ffmpeg -y -i "$IMAGE_FILE" -vf "scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2" -frames:v 1 "$TMP_IMAGE" 2>/dev/null

    # Step 2: Generate video — ultra fast (1fps, ultrafast x264, fast aac)
    echo -e "  ${YELLOW}Encoding video + audio (ultrafast)...${NC}"
    ffmpeg -y \
        -loop 1 \
        -framerate 1 \
        -i "$TMP_IMAGE" \
        -i "$AUDIO_FILE" \
        -c:v libx264 -preset ultrafast -tune stillimage -crf 28 \
        -c:a aac -b:a 160k -profile:a aac_low \
        -shortest -pix_fmt yuv420p -r 1 \
        "$OUTPUT_FILE" 2>&1

    FFMPEG_EXIT=$?
    rm -f "$TMP_IMAGE"

    echo ""
    if [ $FFMPEG_EXIT -ne 0 ] || [ ! -f "$OUTPUT_FILE" ] || [ $(stat -c%s "$OUTPUT_FILE" 2>/dev/null) -lt 1000 ]; then
        echo -e "${RED}❌ Fast method failed. Trying fallback (audio + video combined)...${NC}"

        ffmpeg -y \
            -loop 1 \
            -framerate 0.5 \
            -i "$IMAGE_FILE" \
            -i "$AUDIO_FILE" \
            -c:v libx264 -preset ultrafast -crf 30 -tune stillimage \
            -c:a aac -b:a 160k -profile:a aac_low \
            -shortest -pix_fmt yuv420p -r 0.5 \
            -vf "scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2" \
            "$OUTPUT_FILE" 2>&1
    fi

    if [ -f "$OUTPUT_FILE" ] && [ $(stat -c%s "$OUTPUT_FILE" 2>/dev/null) -gt 1000 ]; then
        echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "  ${GREEN}✅ Video generated!${NC}"
        echo -e "  📁 ${BOLD}$OUTPUT_FILE${NC}"
        SIZE=$(du -h "$OUTPUT_FILE" | cut -f1)
        echo -e "  ⏱  Duration: $(printf "%02d:%02d:%02d" $((DURATION_INT/3600)) $(( (DURATION_INT%3600)/60 )) $((DURATION_INT%60)) )"
        echo -e "  💾 Size: ${BOLD}$SIZE${NC}"
        echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        exit 0
    else
        echo -e "${RED}❌ Failed to generate video.${NC}"
        [ -f "$OUTPUT_FILE" ] && rm -f "$OUTPUT_FILE"
        exit 1
    fi
}

# ─── Main ────────────────────────────────────────────────
if [ -n "$1" ]; then
    generate "$1"
else
    pick_story
    generate "$SELECTED_STORY"
fi
