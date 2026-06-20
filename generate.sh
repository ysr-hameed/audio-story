#!/bin/bash
# Hypz Original — Unified Generator
# Story → TTS Audio → Video in one command
#
# Usage:
#   ./generate.sh                        # Interactive mode
#   ./generate.sh STORY_NAME             # Direct: TTS + video
#   ./generate.sh STORY_NAME --tts       # Only TTS audio
#   ./generate.sh STORY_NAME --video     # Only video (needs audio)
#   ./generate.sh --model <model.onnx>   # Choose voice model

BASE_DIR="/home/ysr-hameed/Documents/Project/audio-story/STORIES"
PIPER_HOME="$HOME/Documents/library/piper"
PIPER_BIN="$PIPER_HOME/bin/piper"
MODEL="${PIPER_MODEL:-hi_IN-pratham-medium.onnx}"
MODEL_PATH="$PIPER_HOME/models/$MODEL"

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

# ─── Parse flags ──────────────────────────────────────
MODE=""
STORY_ARG=""
while [ $# -gt 0 ]; do
    case "$1" in
        --tts) MODE="tts"; shift ;;
        --video) MODE="video"; shift ;;
        --both) MODE="both"; shift ;;
        --model) shift; MODEL="$1"; MODEL_PATH="$PIPER_HOME/models/$MODEL"; shift ;;
        --help) echo -e "${CYAN}Usage:${NC} ./generate.sh [story] [--tts|--video|--both] [--model file.onnx]"; exit 0 ;;
        *) STORY_ARG="$1"; shift ;;
    esac
done

# ─── List stories with status ──────────────────────────
list_stories() {
    local stories=()
    for dir in "$BASE_DIR"/*/; do
        [ -d "$dir" ] || continue
        name="$(basename "$dir")"
        txt=""; [ -f "$dir/story.txt" ] && txt="1"
        aud=""; [ -f "$dir/audio.wav" ] && aud="1"
        vid=""; [ -f "$dir/video.mp4" ] && vid="1"
        status=""
        [ -n "$txt" ] && status="${status}📄" || status="${status}❌"
        [ -n "$aud" ] && status="${status}🔊" || status="${status}⬜"
        [ -n "$vid" ] && status="${status}✅" || status="${status}⬜"
        stories+=("$name|$status")
    done
    echo "${stories[@]}"
}

# ─── Interactive picker ────────────────────────────────
pick_story() {
    local all=($(list_stories))
    [ ${#all[@]} -eq 0 ] && echo -e "${RED}❌ No stories found in STORIES/${NC}" && exit 1

    echo ""
    echo -e "${BOLD}╔══════════════════════════════╗${NC}"
    echo -e "${BOLD}  ║   Hypz Original — Studio     ║${NC}"
    echo -e "${BOLD}  ║   Unified Generator           ║${NC}"
    echo -e "${BOLD}  ╚══════════════════════════════╝${NC}"

    echo -e "\n${BOLD}📂 Stories${NC}"
    echo -e "────────────────────────"
    local i=1
    for entry in "${all[@]}"; do
        name="${entry%%|*}"
        status="${entry#*|}"
        echo -e "  $i. $name  $status"
        ((i++))
    done
    echo -e "────────────────────────"
    echo -e "  s search  q quit"
    echo -e "────────────────────────"

    local SELECTED_STORY=""
    while true; do
        echo -ne "${CYAN}Select: ${NC}"; read -r sel
        [ "$sel" == "q" ] && exit 0
        if [ "$sel" == "s" ]; then
            echo -ne "${CYAN}Search (name): ${NC}"; read -r query
            [ -z "$query" ] && continue
            local matches=()
            for entry in "${all[@]}"; do
                name="${entry%%|*}"
                [[ "$name" == *"$query"* ]] && matches+=("$name")
            done
            [ ${#matches[@]} -eq 0 ] && echo -e "${RED}No matches${NC}" && continue
            [ ${#matches[@]} -eq 1 ] && SELECTED_STORY="${matches[0]}" && break
            echo -e "\n${BOLD}Matches:${NC}"
            for i in "${!matches[@]}"; do printf "  %2d) %s\n" $((i+1)) "${matches[$i]}"; done
            echo -ne "${CYAN}Select number: ${NC}"; read -r msel
            [[ "$msel" =~ ^[0-9]+$ ]] && [ "$msel" -ge 1 ] && [ "$msel" -le "${#matches[@]}" ] && SELECTED_STORY="${matches[$((msel-1))]}" && break
            continue
        fi
        if [[ "$sel" =~ ^[0-9]+$ ]] && [ "$sel" -ge 1 ] && [ "$sel" -le "${#all[@]}" ]; then
            entry="${all[$((sel-1))]}"
            SELECTED_STORY="${entry%%|*}"
            break
        fi
    done
    STORY_NAME="$SELECTED_STORY"
}

# ─── Ask what to generate ─────────────────────────────
ask_mode() {
    local name="$1" dir="$BASE_DIR/$name"
    local has_txt=0; [ -f "$dir/story.txt" ] && has_txt=1
    local has_aud=0; [ -f "$dir/audio.wav" ] && has_aud=1
    local has_img=0
    for f in "$dir"/thumbnail.*; do [ -f "$f" ] && has_img=1 && break; done
    local has_vid=0; [ -f "$dir/video.mp4" ] && has_vid=1

    echo ""
    echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "  ${CYAN}$name${NC}"
    echo ""
    [ $has_txt -eq 1 ] && echo -e "  📄 story.txt     ✅" || echo -e "  📄 story.txt     ❌"
    [ $has_aud -eq 1 ] && echo -e "  🔊 audio.wav     ✅" || echo -e "  🔊 audio.wav     ⬜"
    [ $has_img -eq 1 ] && echo -e "  🖼 thumbnail     ✅" || echo -e "  🖼 thumbnail     ❌"
    [ $has_vid -eq 1 ] && echo -e "  ✅ video.mp4     ✅" || echo -e "  ✅ video.mp4     ⬜"
    echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

    if [ $has_txt -eq 0 ]; then
        echo -e "${RED}❌ story.txt missing. Cannot generate anything.${NC}"
        exit 1
    fi

    local options=()
    [ $has_txt -eq 1 ] && options+=("1")
    local opt_txt=""
    [ $has_txt -eq 1 ] && opt_txt="1) 🎙  Generate TTS Audio only"

    local vid_opt=""
    if [ $has_aud -eq 1 ] && [ $has_img -eq 1 ]; then
        vid_opt="2) 🎬  Generate Video only"
    elif [ $has_aud -eq 0 ] && [ $has_img -eq 1 ]; then
        vid_opt="2) 🎬  Generate Video (needs TTS first)"
    fi

    [ -n "$opt_txt" ] && echo -e "  $opt_txt"
    [ -n "$vid_opt" ] && echo -e "  $vid_opt"
    echo -e "  3) 🔄  Full Pipeline (TTS → Video)"
    echo -e "  q) Quit"
    echo -ne "${CYAN}Choose: ${NC}"; read -r choice

    case "$choice" in
        1) MODE="tts" ;;
        2)
            if [ $has_aud -eq 0 ]; then
                echo -e "${YELLOW}⚠️  No audio found. Run TTS first? (Y/n): ${NC}"
                read -r confirm
                if [[ ! "$confirm" =~ ^[nN] ]]; then
                    MODE="both"
                else
                    echo -e "${RED}Cancelled${NC}"; exit 0
                fi
            else
                MODE="video"
            fi
            ;;
        3) MODE="both" ;;
        q) exit 0 ;;
        *) echo -e "${RED}Invalid choice${NC}"; exit 1 ;;
    esac
}

# ─── Generate TTS Audio ────────────────────────────────
generate_tts() {
    local name="$1" dir="$BASE_DIR/$name" file="$dir/story.txt" out="$dir/audio.wav"

    if [ ! -f "$file" ]; then
        echo -e "${RED}❌ story.txt not found in $dir${NC}"
        exit 1
    fi

    if [ ! -f "$PIPER_BIN" ]; then
        echo -e "${RED}❌ Piper not found at $PIPER_BIN${NC}"
        exit 1
    fi

    if [ ! -f "$MODEL_PATH" ]; then
        echo -e "${RED}❌ Model not found: $MODEL${NC}"
        exit 1
    fi

    if [ -f "$out" ]; then
        echo -ne "${YELLOW}⚠️  audio.wav exists. Regenerate? (y/N): ${NC}"; read -r ow
        [[ ! "$ow" =~ ^[yY] ]] && echo -e "  ${YELLOW}Skipping TTS${NC}" && return 0
    fi

    echo -e "  ${YELLOW}Generating TTS audio (${MODEL})...${NC}"
    mkdir -p "$dir"
    export LD_LIBRARY_PATH="$PIPER_HOME/lib:$LD_LIBRARY_PATH"
    export ESPEAK_DATA_PATH="$PIPER_HOME/lib/espeak-ng-data"

    TEXT=$(cat "$file")
    echo "$TEXT" | "$PIPER_BIN" \
        --model "$MODEL_PATH" \
        --length-scale 1.15 \
        --noise-scale 0.11 \
        --noise-w 0.11 \
        --sentence-silence 0.25 \
        --output-file "$out"

    local size=$(du -h "$out" | cut -f1)
    echo -e "  ${GREEN}✅ Audio: $size${NC}"
}

# ─── Generate Video ────────────────────────────────────
generate_video() {
    local name="$1" dir="$BASE_DIR/$name" out="$dir/video.mp4"

    local img=""
    for f in "$dir"/thumbnail.*; do [ -f "$f" ] && img="$f" && break; done
    if [ -z "$img" ]; then
        echo -e "${RED}❌ No thumbnail in $dir${NC}"
        exit 1
    fi

    local aud=""
    for f in "$dir"/audio.wav "$dir"/audio.mp3 "$dir"/audio.m4a "$dir"/audio.*; do [ -f "$f" ] && aud="$f" && break; done
    if [ -z "$aud" ]; then
        echo -e "${RED}❌ No audio in $dir${NC}"
        exit 1
    fi

    local dur=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$aud" 2>/dev/null)
    if [ -z "$dur" ]; then
        echo -e "${RED}❌ Could not read audio duration${NC}"
        exit 1
    fi
    local dur_int=$(printf "%.0f" "$dur")

    echo -e "\n${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "  ${CYAN}Generating Video${NC}"
    echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "  ${YELLOW}Story:${NC}   $name"
    echo -e "  ✅ Thumbnail: $(basename "$img") ($(du -h "$img" | cut -f1))"
    echo -e "  ✅ Audio: $(basename "$aud") ($(du -h "$aud" | cut -f1))"
    echo -e "  ⏱  Duration: $(printf "%02d:%02d:%02d" $((dur_int/3600)) $(((dur_int%3600)/60)) $((dur_int%60)))"

    if [ -f "$out" ]; then
        echo -e "  ⚠️  Existing video: $(du -h "$out" | cut -f1)"
        echo -ne "${YELLOW}Overwrite? (y/N): ${NC}"; read -r ow
        [[ ! "$ow" =~ ^[yY] ]] && echo -e "  ${YELLOW}Cancelled${NC}" && exit 0
    fi
    echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

    local tmp="/tmp/hypz_${name}_resized.png"
    ffmpeg -y -i "$img" -vf "scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2" -frames:v 1 "$tmp" 2>/dev/null

    echo -e "  ${YELLOW}Encoding...${NC}"
    ffmpeg -y -loop 1 -framerate 1 -i "$tmp" -i "$aud" \
        -c:v libx264 -preset ultrafast -tune stillimage -crf 28 \
        -c:a aac -b:a 160k -profile:a aac_low \
        -shortest -pix_fmt yuv420p -r 1 "$out" 2>&1 | tail -1

    rm -f "$tmp"

    if [ -f "$out" ] && [ $(stat -c%s "$out" 2>/dev/null) -gt 1000 ]; then
        local size=$(du -h "$out" | cut -f1)
        echo -e "\n${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "  ${GREEN}✅ Video generated!${NC}"
        echo -e "  📁 ${BOLD}$out${NC}"
        echo -e "  ⏱  $(printf "%02d:%02d:%02d" $((dur_int/3600)) $(((dur_int%3600)/60)) $((dur_int%60)))"
        echo -e "  💾 ${BOLD}$size${NC}"
        echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    else
        echo -e "${RED}❌ Failed${NC}"
        [ -f "$out" ] && rm -f "$out"
        exit 1
    fi
}

# ─── Main ──────────────────────────────────────────────
STORY_NAME=""
if [ -n "$STORY_ARG" ]; then
    STORY_NAME="$STORY_ARG"
    if [ ! -d "$BASE_DIR/$STORY_NAME" ]; then
        echo -e "${RED}❌ Story '$STORY_NAME' not found in STORIES/${NC}"
        exit 1
    fi
    if [ -z "$MODE" ]; then
        ask_mode "$STORY_NAME"
    fi
else
    pick_story
    ask_mode "$STORY_NAME"
fi

echo ""
echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  ${CYAN}Hypz Original — $STORY_NAME${NC}"
echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

case "$MODE" in
    tts)   generate_tts "$STORY_NAME" ;;
    video) generate_video "$STORY_NAME" ;;
    both)
        generate_tts "$STORY_NAME"
        generate_video "$STORY_NAME"
        ;;
esac