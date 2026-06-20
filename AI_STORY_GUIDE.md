# AI STORY GENERATION GUIDE — TTS Hindi Story (Psychological + Supernatural)

> **⚠️ MANDATORY: Story must be 9,000+ words (minimum). Target 9,000-12,000. Can exceed 12,000 anytime. Anything below 9,000 is a failed story. Use chunk-based generation (see 0.1) — no AI can generate this in one response. Write in FULL DETAIL from the start — no expanding later.**

## SECTION 0: HOW TO USE THIS GUIDE

1. Read all sections in order before generating.
2. Section 1-3 rules are MANDATORY. Never break them.
3. Section 4-15 must all be followed.
4. Section 14 (Variation System) ensures every story is different. Pick one option from each category.
5. After generation, verify with Section 16 checklist.
6. Final .md file must contain ONLY story text — no chapter numbers, no notes, no metadata.
7. **Folder structure:** Every story goes in `STORIES/[story-title]/story.txt` with an SEO file (see Section 0.2).
8. **Filename = story title** in Devanagari transliteration. No separate title inside the file.

## SECTION 0.1: CHUNK-BASED GENERATION (CRITICAL WORKFLOW)

**No AI can generate 9,000-12,000+ words in one response.** The guide enforces short sentences (15-20 words) AND long total length — these two requirements must be reconciled through chunk-based generation.

### 0.1.1 The Chunk Method

Generate the story in sequential chunks, each 1,500-2,500 words. Complete ALL chunks in a single continuous session (do NOT stop mid-story and resume later).

```
STORY STRUCTURE (9,000-12,000+ words)

CHUNK 1: Opening ~ 1,500-2,500 words
├── Hook (first 100 words — no time/location)
├── Character introduction (shown through action, not described)
├── Inciting event
└── End with cliffhanger/question

CHUNK 2: Rising Action ~ 1,500-2,500 words
├── Character reacts to event
├── Psychological depth begins
├── First ambiguous element
└── End with revelation

CHUNK 3: Deepening ~ 1,500-2,500 words
├── Reality starts blurring
├── More characters involved
├── Supernatural hint appears
└── End with twist

CHUNK 4: Climax ~ 1,500-2,500 words
├── Everything changes
├── Emotional peak
├── Two possible explanations emerge
└── End with confrontation/choice

CHUNK 5: Resolution ~ 1,500-2,500 words
├── Aftermath
├── Final ambiguity
└── Satisfying close
```

### 0.1.2 Chunk Workflow Rules

1. Generate chunks in sequence — never skip ahead
2. Each chunk must be self-contained (has its own mini-arc) but connected to the whole
3. At the END of each chunk, state: `[CHUNK X COMPLETE — CURRENT WORD COUNT: Y]`
4. Track running total word count after every chunk
5. If after 5 chunks the total is below 9,000, generate additional chunks (6, 7, etc.)
6. Each chunk MUST follow all TTS rules (short sentences, verbs, attribution before dialogue)
7. Do NOT include the `[CHUNK...]` marker in the final file — use it only during generation
8. Once all chunks are generated, combine them into a single .md file with ONLY story text

### 0.1.3 Length Tracking Table (Create Before Starting)

Fill and update this table during generation. Do NOT delete until story is complete.

```
| Chunk | Target Words | Actual Words | Running Total | Key Events |
|-------|-------------|-------------|---------------|------------|
| 1 | 2,000 | [fill] | [fill] | [fill] |
| 2 | 2,000 | [fill] | [fill] | [fill] |
| 3 | 2,000 | [fill] | [fill] | [fill] |
| 4 | 2,000 | [fill] | [fill] | [fill] |
| 5 | 2,000 | [fill] | [fill] | [fill] |
| TOTAL | 10,000 | [sum] | [final] | — |
```

### 0.1.4 Minimum Target Enforcement

| Rule | Detail |
|------|--------|
| **Absolute minimum** | 9,000 words — never below this |
| **Target range** | 9,000-12,000 words (ideal) |
| **Can exceed 12,000?** | YES — can go up to 15,000+ if story needs it |
| **Must NOT be under** | 9,000 words under any circumstances |
| **After all chunks** | Verify `wc -w` on final file. If under 9,000, add more chunks |

### 0.1.5 Detail-First Writing (Never Expand Later)

**Critical lesson from aakhri-shabd.md:** The story had to be manually expanded from ~4,200 to ~9,000 words because initial version was too short.

**Rule:** Every scene must be written in FULL DETAIL on the first pass. No second passes for expansion.

| ❌ Wrong Approach | ✅ Right Approach |
|------------------|------------------|
| "I'll write a short version and expand later" | "I will write 2,000 words per chunk with full sensory detail" |
| Sparse scenes, minimal description | Every scene has: 5 senses, character emotions, environmental detail, dialogue |
| Brief dialogue exchanges | Extended conversations with natural hesitation, emotion, subtext |
| Scene jumps (skipping time) | Every important moment is SHOWN, not summarized |
| One-line descriptions | Full scenes that breathe and develop |

**Scene Detail Checklist (apply to every scene):**
- [ ] What does the character SEE? (environment, objects, people)
- [ ] What do they HEAR? (sounds, silence, voices)
- [ ] What do they FEEL physically? (cold, warmth, pain, touch)
- [ ] What do they FEEL emotionally? (shown through body/physical reactions)
- [ ] What is the atmosphere? (time of day, weather, mood)
- [ ] Is there dialogue? (extended, natural, not rushed)
- [ ] Does the scene advance plot OR deepen character? (preferably both)
- [ ] Is the scene at least 200-400 words? (if shorter, it's probably skimped)

### 0.1.6 What NOT To Do

| ❌ Don't | ✅ Do |
|----------|-------|
| Generate 5,000 words and call it done | Generate until you hit 9,000+ minimum |
| Write skeleton scenes | Write full, breathing scenes with all senses |
| Skip chunks to save time | Complete every chunk with full detail |
| Split a single scene across chunks | Complete each scene within one chunk |
| Generate 500-word scenes | Minimum scene length: 200-400 words |
| Leave ambiguity for "later" | Build ambiguity into the scene itself |

---

## SECTION 0.2: STORIES FOLDER STRUCTURE (MANDATORY)

Every story must be saved in a standardized folder structure for YouTube publishing.

### 0.2.1 Folder & File Structure

```
STORIES/
├── [story-title-in-english]/
│   ├── story.txt        # Full story text (ONLY story, no metadata)
│   └── seo.md          # YouTube SEO (title, description, tags, thumbnail prompt)
```

### 0.2.2 Rules

| # | Rule | Example |
|---|------|---------|
| 1 | **Folder name** = story title in Roman transliteration, **ALL CAPS**. Upper-kebab-case. | `AAKHRI-SHABD/`, `VO-TEEN-MINUTE/` |
| 2 | **story.txt** = ONLY story text. Zero metadata. No title. | Pure narrative |
| 3 | **seo.md** = YouTube Optimized SEO | Title, description, tags, thumbnail prompt |
| 4 | **seo.md filename** = same as YouTube video title (Roman transliteration) | `aakhri-shabd-seo.md` → but keep as `seo.md` inside folder |
| 5 | Every story gets its OWN folder | Never mix stories in one folder |

### 0.2.3 seo.md Format (Create After Story)

```markdown
# YouTube SEO — [Hindi Title] ([Roman Title])

---

## Video Title
[Max 55-60 chars. Main keyword FIRST. Pipe separated. Include genre + hook]

✅ Example: `आखिरी शब्द | डरावनी हिंदी कहानी | लाश गायब, पत्नी का निशान नहीं`
❌ Too long: `आखिरी शब्द | पति ने कबूल किया हत्या, पर लाश गायब | साइकोलॉजिकल हॉरर स्टोरी` (83 chars)

---

## Description
[200-350 words. First 100 chars = most critical for YouTube search.]

**Structure:**
```
[2-3 lines — strongest hook. What happens. End with a question/tease.]

[2-3 lines — the twist. The psychological/emotional angle.]

[1 line — who this is for: "अगर आपको X पसंद है तो यह वीडियो आपके लिए"]

[HASHTAGS — 4-5 hashtags: #हिंदीकहानी #हॉररस्टोरी #genre #channelname]

[CTA — अगर आपको यह कहानी पसंद आए तो लाइक करें, सब्सक्राइब करें और बेल आइकन दबाएँ।]
```

---

## Tags (10-15 tags)
[Primary genre in Hindi], [Secondary genre in Hindi], [English genre], [Broad keyword], [Niche keyword], [Brand tag: hypz original]

---

## Thumbnail Prompt (For AI Image Generation)

**Size:** 1280×720 (16:9 landscape)

**Prompt:**
[Scene description + Lighting & colors + Mood/atmosphere + What characters do + Add bold Hindi text at the top: "TITLE" in white with [color] shadow + Hyper-realistic + 16:9]

---

## Video Length
~[X] minutes ([X] words)

## Language
Hindi (Devanagari)

## Mood
[Genre tags — Psychological, Emotional, Horror, Suspense, etc.]
```

### 0.2.4 SEO Best Practices

| Element | Rule | ✅ Example |
|---------|------|-----------|
| Title | Max 55-60 chars. Main keyword FIRST. Pipe separated. Include genre. First 40 chars = most important for clicks. | `आखिरी शब्द | डरावनी हिंदी कहानी | लाश गायब` |
| Description | 200-350 words. **First 100 chars = YouTube search critical.** Hook + twist + hashtags (4-5) + CTA. Hashtags boost discoverability. | First line must hook immediately. |
| Tags | 10-15 tags. Mix: Hindi broad + Hindi niche + English + brand (`hypz original`). No misleading tags. | `डरावनी कहानी, हिंदी हॉरर स्टोरी, suspense story, hypz original` |
| Hashtags | 4-5 in description. First 3 = most important for YouTube algorithm. Always include `#channelname`. | `#हिंदीकहानी #हॉररस्टोरी #hypzoriginal` |
| Thumbnail prompt | 1280×720 (16:9). Tell AI exact text: `Add bold Hindi text at the top: "TITLE" in white with [color] shadow`. DALL-E 3 best for text. | `Add bold Hindi text at the top: "आखिरी शब्द" in white with red shadow` |
| Category | Entertainment | — |

### 0.2.5 File Management

| Action | Command |
|--------|---------|
| Create folder | `mkdir -p STORIES/[story-name]/` |
| Move story | `mv story.txt STORIES/[story-name]/story.txt` |
| Verify structure | `ls STORIES/[story-name]/` → should show `story.txt`, `seo.md`, `thumbnail.jpg`, `audio.wav` |

### 0.2.6 Final Folder Structure (Complete)

```
STORIES/[story-name]/
├── story.txt          # Story text (pure narrative, no metadata)
├── seo.md            # YouTube SEO (title, description, tags, thumbnail prompt)
├── thumbnail.jpg     # YouTube thumbnail image (1280×720)
├── audio.wav         # TTS-generated audio file
└── video.mp4          # Generated video (static image + audio)
```

After all files are ready, run from project root:
```bash
./generate-video.sh          # Interactive mode — pick/search story
./generate-video.sh aakhri-shabd  # Direct mode
```

### 0.2.7 Video Generation

`generate-video.sh` (interactive TUI) creates a YouTube-ready video by combining:
- **Image:** `STORIES/[story-name]/thumbnail.*` (any format — jpg, png, webp, etc.)
- **Audio:** `STORIES/[story-name]/audio.*` (any format — wav, mp3, m4a, etc.)
- **Output:** `STORIES/[story-name]/video.mp4`

**Features:**
- Interactive story picker with numbered menu
- Search/filter stories by name
- Shows file status per story (🖼 image, 🔊 audio, ✅ video exists)
- Confirmation before generating
- FFmpeg: H.264 video + AAC 192kbps audio

---

## SECTION 1: LANGUAGE RULES (MANDATORY)

| Rule | ✅ Correct | ❌ Incorrect |
|------|-----------|-------------|
| Modern Hindi — not bookish, not rural | "उसने कहा" | "उसने कथित" |
| Short sentences — max 15-20 words | "रात के दस बज रहे थे। कोहरा घना था।" | Long chains with "और/जो" |
| Simple words — no Sanskrit | "बहुत", "लेकिन", "इसलिए" | "अत्यंत", "किंतु", "अतः" |
| Common English words OK | फ़ोन, कार, ऑफिस, रिपोर्ट | Unnecessary English |
| Urdu-mixed words fine | खून, सबूत, कत्ल, बयान | Overly Persian |
| Every sentence must have a verb | "वह मेज़ पर बैठा था।" | "पतला। छोटा कद।" (fragment) |
| One idea per sentence | Short clear sentences | Multiple ideas crammed |

**Words to AVOID:**
```
❌ तदुपरांत → ✅ उसके बाद     ❌ पर्याप्त → ✅ काफ़ी
❌ सर्वप्रथम → ✅ सबसे पहले   ❌ तत्काल → ✅ तुरंत
❌ परन्तु → ✅ लेकिन           ❌ अतः → ✅ इसलिए
❌ किंतु → ✅ मगर              ❌ अत्यंत → ✅ बहुत
❌ पुनः → ✅ फिर से           ❌ निकट → ✅ पास
```

---

## SECTION 2: TTS RULES (MANDATORY)

### 2.1 Sentence Structure

- Max 15-20 words per sentence
- One thought per sentence — don't chain with "और/जो/क्योंकि"
- 10-12 words ideal for TTS

✅ **Correct:**
```
रात के दस बज रहे थे। सड़क पर सन्नाटा था।
एक कार धीरे-धीरे आ रही थी। उसकी हेडलाइट्स बंद थीं।
```

❌ **Incorrect:**
```
रात के दस बज रहे थे और सड़क पर सन्नाटा था जब एक कार आ रही थी जिसकी हेडलाइट्स बंद थीं।
```

### 2.2 Punctuation

| Symbol | Use | TTS Effect |
|--------|-----|------------|
| । | End of sentence | Long pause — essential |
| , | Short pause | Small breath — use sparingly |
| ? | Question | TTS changes tone |
| — | Dramatic pause | Medium break |
| " " | Dialogue | TTS knows it's speech |
| ... | Suspense | TTS slows down |

### 2.3 Homographs (TTS May Misread)

| Word | Issue | Fix |
|------|-------|-----|
| पर | "but" or "on" | Context clear |
| और | Can sound like "ओर" | Context clear |
| किरदार | 'र' pronunciation | Keep as is |
| साल | Year or breathe | Context clear |

### 2.4 Character Names

- One name per character throughout the story
- 3+ letter names preferred (TTS reads better)
- Avoid similar sounding names (TTS may confuse)

### 2.5 Fragment Avoidance (CRITICAL)

**Problem:** Multiple fragments together = TTS reads as word-list, no flow.

❌ **Common fragments:**
```
❌ "पतला। छोटा कद। आँखों में डर।"
❌ "वकील का मर्डर। ऑफिस में। सिर पर चोट।"
❌ "काले रंग का जैकेट। पैरों में स्नीकर्स।"
```

✅ **Fix — every sentence must have verb:**
```
✅ "वह पतला था और उसका कद छोटा था। उसकी आँखों में डर था।"
✅ "रास्ते में उसने सोचा कि यह आम लूटपाट का केस नहीं है। एक वकील का मर्डर ऑफिस में हुआ है। सिर पर चोट के निशान हैं।"
✅ "उसने नीली जींस पहनी। उसके ऊपर काले रंग का जैकेट डाला। पैरों में स्नीकर्स पहने।"
```

**Test:** Read every sentence aloud. If it sounds incomplete alone — fix it.

---

## SECTION 3: OUTPUT FORMAT (MANDATORY)

**Final file = ONLY story. Nothing else.**

| ❌ Never Include | ✅ Only Include |
|----------------|----------------|
| "Chapter 1" or "चैप्टर 1" | Pure story narrative |
| "###" or "#" markdown | Empty line between scene changes |
| Metadata — word count, timing | Dialogue in " " quotes |
| Instructions or notes | Time/location change = new line |
| Decorative lines "---" | One empty line = scene break |

---

## SECTION 4: STORY LENGTH & PACING

### 4.1 TTS Timing

| Target | Words | TTS Time |
|--------|-------|----------|
| **Hard minimum** | **9,000** | **~50 min** |
| Target range | 9,000-12,000 | ~50-60 min |
| Can exceed up to | 15,000+ | ~80 min |
| Per chunk | 1,500-2,500 | ~8-15 min |

**Never go below 9,000. Can always exceed. No upper cap.**

### 4.2 Chapter Breakdown

| Chapter | Words | Purpose | End With |
|---------|-------|---------|----------|
| 1 | ~1,200 | Hook — grab reader | Cliffhanger |
| 2-5 | ~1,500 each | Story unfolds, psychological depth | Revelation |
| 6-7 | ~1,500-1,800 | Climax + resolution | Satisfying close |

### 4.3 Three-Act Structure

```
ACT 1 (25% — ~2,500 words)
├── Unique hook
├── Character intro
├── Normal world shown
└── Strange event disrupts everything

ACT 2 (50% — ~5,000 words)
├── Character tries to understand
├── Reality starts blurring
├── Psychological depth emerges
├── Supernatural hint appears
└── Mid-point twist — everything changes

ACT 3 (25% — ~2,500 words)
├── Master twist
├── Climax — emotional or psychological
└── Ambiguous or satisfying ending
```

---

## SECTION 5: PLOT STRUCTURE

### 5.1 Three-Layer Plot

Every story must have three layers that reveal progressively deeper truth.

| Layer | What It Is | Reader Believes |
|-------|-----------|----------------|
| 1 — Surface | What appears to happen | Simple explanation |
| 2 — Psychological | Hidden trauma, fear, memory | Reality starts blurring |
| 3 — Supernatural | Ambiguous twist | Could be real or in the mind |

**Layer transitions:**
- Layer 1→2: Something doesn't add up. Character notices.
- Layer 2→3: Everything believed is wrong. New truth emerges.
- Layer 3: Final reveal — changes everything. Never 100% confirm.

### 5.2 Story Arc (No Detective Version)

The story follows a NORMAL PERSON experiencing something beyond their understanding.

```
ACT 1 — Normal life disrupted
├── Character is living ordinary life
├── Something strange happens (small at first)
├── Character tries to ignore it
└── But it gets worse, can't ignore anymore

ACT 2 — Descent into uncertainty
├── Character investigates in their own way
├── They ask questions, but answers don't help
├── Psychological pressure builds
├── Supernatural element appears (ambiguous)
└── Mid-point: character realizes they're part of this

ACT 3 — Truth or illusion?
├── Two possible explanations emerge
├── Character must choose what to believe
├── Climax is emotional, not procedural
└── Ending: satisfying but may remain ambiguous
```

### 5.3 How The Story Unfolds

No detective. No police investigation. The story unfolds through:

| Method | Example |
|--------|---------|
| Character's own experience | They see, hear, feel strange things |
| Talking to other people | Friends, family, strangers who know something |
| Discovering old things | Letters, photos, objects that don't fit |
| Memory | Remembering things differently over time |
| Physical evidence | Things that contradict what should be true |

### 5.4 Clue Types

| Level | Example |
|-------|---------|
| Obvious | Something is missing, someone is lying |
| Medium | A clue that leads somewhere unexpected |
| Subtle | A detail that seemed minor — becomes crucial later |

---

## SECTION 6: MAIN CHARACTER RULES (CRITICAL)

### 6.1 Golden Rule

> **The main character must be a NORMAL PERSON. No detective. No police officer. No investigator. Just someone who gets caught up in something strange.**

No police stories. No investigative procedurals. People in India don't enjoy police-centric stories. Keep police out or at absolute minimum background.

### 6.2 Character Types (Pick One)

| Type | Example | Why It Works |
|------|---------|-------------|
| Common person | Office worker, shopkeeper, driver | Everyone relates to them |
| Family member | Husband/wife/son/daughter | Emotional connection to events |
| Friend/neighbor | Lives nearby, knows everyone | Natural reason to be involved |
| Journalist | News reporter | Reason to dig deeper (but not investigator) |
| Doctor/Nurse | Hospital worker | Sees things others don't |
| Student/Teacher | College/school setting | Fresh perspective |
| Artist/Writer | Creative person | Sensitive to details others miss |
| Old person | Has seen many things | Wisdom + unreliable memory |

### 6.3 Character Requirements

| Element | Why | Example |
|---------|-----|---------|
| Normal life | Reader connects | Has a job, family, routine |
| Personal stake | Not professional curiosity | It's their life being affected |
| A flaw | Feels real | They're scared, confused, stubborn |
| Emotional depth | Reader cares | They have relationships, memories |
| No special skills | No detective moves | They figure things out like normal people |

### 6.4 Character Voice

| Rule | ✅ Do | ❌ Don't |
|------|------|---------|
| Speak naturally | "यार, मुझे समझ नहीं आ रहा..." | Too formal or intellectual |
| React like real person | Get scared, confused, angry | Always calm and analytical |
| Have limits | Give up sometimes, cry | Never break down |
| Grow through story | Change by the end | Stay the same person |

### 6.5 Character Template

```
नाम: [पूरा नाम]
उम्र: [उम्र]
पेशा: [सामान्य नौकरी]
रहने का स्थान: [शहर/एरिया]
परिवार: [कौन-कौन है]
स्वभाव: [शांत/गर्म/मिलनसार/अकेला]
कमज़ोरी: [एक चीज़ जो उन्हें तोड़ती है]
ज़िंदगी में क्या चल रहा है: [सामान्य दिनचर्या]
स्टोरी से कनेक्शन: [वे इस घटना से क्यों जुड़े?]
```

---

## SECTION 7: SUPPORTING CHARACTERS

| Character | Role | Notes |
|-----------|------|-------|
| Close person | Friend/family who supports | Or betrays — adds emotion |
| Stranger with answers | Someone who knows something | May or may not help |
| Authority figure* | Minimal role if needed | Keep brief, not main focus |

*Police/authority: Use only if absolutely necessary. Keep screen time minimal. Not a main character.

**All characters should be normal people.** No specialists, no experts, no investigators.

---

## SECTION 8: ANTI-AI RULES — MAKE IT FEEL HUMAN

### 8.1 Opening Rules

**NEVER start with time + location + character description.**

| ❌ AI Opening | ✅ Human Opening |
|-------------|----------------|
| "रात के दस बज रहे थे। दिल्ली की एक बिल्डिंग में..." | "मैंने अपनी पत्नी को मार डाला," विक्रम ने कहा। |
| "सुबह के सात बज रहे थे। कोहरा था..." | दरवाज़ा खुला तो वहाँ कोई नहीं था। लेकिन घंटी तो किसी ने बजाई थी। |

**Rule:** First line = a question or hook. Reader NEEDS the second line.

### 8.2 Character Description Rules

**NEVER use fragment chains.**

| ❌ AI | ✅ Human |
|------|---------|
| "वह 35 का था। काले बाल। गहरी आँखें। थकान थी।" | "उसने अपनी कॉफी देखी। ठंडी हो चुकी थी। पता नहीं कब से बैठा था।" |
| "वह सुंदर थी। शांत। आँखों में राज़।" | "वह चुप थी। बहुत ज़्यादा चुप। जैसे कोई जिसने बहुत कुछ देखा हो।" |

**Show characters through:** action, dialogue, or other character's eyes.

### 8.3 Dialogue Rules

| ❌ AI Pattern | ✅ Human Pattern |
|-------------|----------------|
| Perfect grammar always | "मैं... मैंने सोचा... पता है... वह आदमी..." |
| All characters same voice | Each character unique |
| Every line drives plot | Some casual talk — "चाय पी लो पहले।" |
| No interruptions | "लेकिन मैं..." "लेकिन कुछ नहीं," उसने काटा। |

### 8.4 Narrator Voice Rules

Narrator must have personality. AI narrators are neutral and boring.

| AI Narrator | Human Narrator |
|------------|---------------|
| "वह कमरे में दाखिल हुआ। मेज़ पर एक किताब थी।" | "किताब वहाँ थी। जहाँ होनी चाहिए थी। लेकिन उसे खोलने से पहले ही पता था — यह कोई आम किताब नहीं थी।" |
| Always objective | Has opinions, uses Hindi idioms |
| No sarcasm | "पुलिस ने केस बंद कर दिया। क्योंकि पुलिस का काम केस बंद करना है, केस सॉल्व करना नहीं।" |

### 8.5 Hidden AI Mistakes

| # | AI Version | Human Version |
|---|-----------|--------------|
| 1 | Everything works first time | "तीन बार कोशिश के बाद ताला खुला।" |
| 2 | No silence | "वह चुप रहा। बहुत देर तक। फिर बोला..." |
| 3 | Everything connects perfectly | Some things remain unexplained |
| 4 | Emotions explained | "वह चुप था। बहुत ज़्यादा चुप। और यही डरावना था।" |
| 5 | Safe metaphors | Unique, risky metaphors |
| 6 | Clean timelines | "पता नहीं कितनी देर बीती।" |
| 7 | Never forget | "उसे याद नहीं था कि वह उस रात कहाँ था।" |

---

## SECTION 9: DIALOGUE WRITING

### 9.1 Format

```
"डायलॉग," नाम ने भावना में कहा।

"डायलॉग?" नाम ने हैरान होकर पूछा।
```

### 9.2 Attribution Rules (CRITICAL for TTS)

**ALWAYS put attribution BEFORE the quote:**

✅ `कबीर ने पूछा, "अंदर क्या है?"`
❌ `"अंदर क्या है?" कबीर ने पूछा।`

**Why:** TTS sets correct tone when it knows who's speaking first.

### 9.3 Dialogue Tags

| Tag | Tone |
|-----|------|
| ने कहा | Neutral |
| ने पूछा | Question |
| ने चिल्लाकर कहा | Anger |
| ने फुसफुसाकर कहा | Fear/secret |
| ने हैरान होकर कहा | Surprise |
| ने धीमी आवाज़ में कहा | Serious |
| ने हँसते हुए कहा | Laughing |

### 9.4 Natural Dialogue Tips

- Characters speak according to their background
- Include hesitation, interruptions, casual talk
- No two characters should sound identical

---

## SECTION 10: SCENE DESCRIPTION

### 10.1 The 5 Senses

Every scene: include 2-3 of these.

| Sense | Examples |
|-------|----------|
| देखना | Place, light, colors |
| सुनना | Sounds, silence |
| महसूस करना | Cold, fear, unease |
| सूंघना | Smell, odor |
| समय | Morning/evening, weather |

### 10.2 Description Formula

```
[Time/Weather] + [Place] + [Atmosphere] + [Character State]
```

**Example:**
```
सर्दियों की वो सुबह थी। कोहरा इतना घना था कि दस फुट दूर कुछ दिखता नहीं था।
वह अपनी कार से उतरा। ठंड से सिकुड़ गया था।
```

---

## SECTION 11: PSYCHOLOGICAL + SUPERNATURAL FORMULA

### 11.1 Element Ratio

| Element | % | Purpose |
|---------|---|---------|
| Human story / relationships | 40% | Base — who the character is |
| Psychological depth | 35% | Fear, memory, trauma, doubt |
| Supernatural ambiguity | 25% | Unexplained — never confirmed |

### 11.2 Psychological Elements

- Character's own mind starts doubting reality
- Old trauma or memory resurfaces
- Fear of being crazy — "Is this really happening?"
- Small details become obsessive
- Reader questions what's real

### 11.3 Supernatural Ambiguity Rules

**Never confirm the supernatural. Always have a logical explanation too.**

| ✅ Ambiguous (do) | ❌ Confirmed (don't) |
|-------------------|---------------------|
| Person vanishes — went somewhere? Was never there? | Ghost took them |
| Voices heard — hallucination or real? | It's a haunted place |
| Dream comes true — coincidence or vision? | Character has psychic powers |

**Three types of supernatural elements:**
1. **Things that vanish** — people, objects, rooms
2. **Patterns** — same event repeating
3. **Sensory deception** — see/hear things others don't

### 11.4 Ending Options

| Type | What Happens | Best For |
|------|-------------|----------|
| Logical | Everything explained. Supernatural was in the mind. | "Aha!" moment |
| Supernatural | Final confirmation it was real. | Dark ending |
| Ambiguous | Both possible. Reader decides. | **2026 default** |

---

## SECTION 12: CHARACTER POSITION & TIMELINE (CRITICAL)

### 12.1 Timeline Table (Create Before Every Scene)

```
समय: [Exact time]
लोकेशन: [Place]

किरदार पोज़ीशन:
- मुख्य किरदार: [Where] — [Doing what]
- किरदार B: [Where] — [Doing what]
```

### 12.2 Travel Time

When character moves: state travel time AND what others did during.

✅ **Correct:**
```
रात नौ बजकर पाँच मिनट पर वह घर से निकला।
ऑटो से बीस मिनट लगे।
इस दौरान उसकी पत्नी घर पर थी। टीवी देख रही थी।
रात नौ बजकर पच्चीस मिनट पर वह वहाँ पहुँचा।
```

---

## SECTION 13: LOGICAL CONSISTENCY

### 13.1 Reality Checks

- [ ] Events are physically possible
- [ ] Supernatural = ambiguous (not confirmed)
- [ ] Time and distance are realistic
- [ ] Character behavior makes psychological sense
- [ ] No impossible coincidences (unless intentional)

### 13.2 Character Behavior

- [ ] Every character's motivation is clear
- [ ] No one acts "without reason"
- [ ] Emotions are realistic (not textbook)
- [ ] No sudden personality changes
- [ ] Psychologically everything makes sense

---

## SECTION 14: 2026 ADVANCED RULES

### 14.1 Attention Economy

| Rule | How |
|------|-----|
| First 100 words: NO time/location | Start with dialogue, action, question |
| Every scene = mini-movie | Visual + emotional + question hook |
| 2-4 line paragraphs | Mobile-friendly |
| Every chapter = cliffhanger | Last line = unanswered question |
| Something unexpected every 1,000 words | New detail, shift, twist |
| Show emotions, don't explain | "हाथ काँप रहे थे" NOT "वह डरा हुआ था" |

### 14.2 Modern Hindi

| ❌ Avoid | ✅ Use |
|---------|-------|
| निकट, उपस्थित, किंतु, अतः | पास, है/था, लेकिन, इसलिए |
| Pure Sanskrit Hindi | Natural Urdu-mixed Hindi |
| "ने कहा" every time | Varied — बोला, बताया, पूछा |
| Robot Hindi | "वह वहीं खड़ा रह गया।" |

---

## SECTION 15: VARIATION SYSTEM — NEVER REPEAT A STORY

Pick ONE from each category. Track what's used. Never repeat same combo.

### 15.1 Opening Type

1. **Dialogue** — "मैंने अपनी पत्नी को मार डाला," उसने कहा।
2. **Action** — दरवाज़ा खुला। सामने कोई नहीं था। लेकिन घंटी किसी ने बजाई थी।
3. **Question** — तीन दिन हो गए थे। कोई जवाब नहीं आया था।
4. **Unusual detail** — अजीब बात यह थी कि तस्वीर में वह औरत अब नहीं थी।
5. **Emotional** — उसे ऐसा लग रहा था जैसे कोई उसे देख रहा है।
6. **Mid-scene** — वह बैठा रहा। बहुत देर तक। फिर उसने फोन उठाया।

### 15.2 Concept Type

1. Someone confesses — victim doesn't exist / no one remembers them
2. A room or place disappears — was there, now isn't
3. Dreams that match reality — future or past events seen in sleep
4. A crime reported before it happens
5. Character discovers they're not who they thought they were
6. Something repeats — same event, same conversation, same day

### 15.3 Twist Type

1. The "victim" is still alive — someone else died
2. The character caused the events unknowingly
3. Supernatural turns out to be real (final moment only)
4. Memory was false — character remembered wrong
5. The character was the "victim" all along
6. Multiple characters experiencing different versions of the same event

### 15.4 Main Character Type

1. Common person — office worker, shopkeeper
2. Family member — husband/wife/son/daughter
3. Friend or neighbor
4. Journalist or writer
5. Doctor or nurse
6. Student or teacher

### 15.5 Core Conflict

1. Reality vs memory — what is real?
2. Loss vs denial — accepting or refusing truth
3. Trust vs paranoia — who can you believe?
4. Past vs present — old trauma resurfaces
5. Self vs self — fighting own mind
6. Love vs truth — choosing between heart and fact

---

## SECTION 16: EMERGENCY TTS FIXES

| Problem | Fix |
|---------|-----|
| Reads too fast | Add । and , for pauses |
| Wrong word | Simplify vocabulary |
| No emotion | Add ! or ? |
| Sounds robotic | Shorten sentences |
| No scene pause | Add empty line between scenes |

---

## SECTION 17: FINAL CHECKLIST

### Core Rules
- [ ] Every sentence under 20 words
- [ ] Every sentence has a verb (no fragments)
- [ ] No bookish Hindi (किंतु, अतः, पुनः)
- [ ] Dialogue attribution BEFORE the quote
- [ ] Every dialogue identifies the speaker
- [ ] Output = ONLY story text

### Story
- [ ] Main character is a NORMAL person (NOT detective/police)
- [ ] No police or minimal police presence
- [ ] Concept is unique (not predictable pattern)
- [ ] Three layers: surface → psychological → supernatural ambiguity
- [ ] Supernatural is ambiguous — logical explanation also possible
- [ ] Every chapter ends on cliffhanger or question
- [ ] Something unexpected every ~1,000 words

### Anti-AI
- [ ] Story does NOT start with time + location + description
- [ ] Character descriptions NOT fragment chains
- [ ] Every character speaks differently
- [ ] Narrator has personality (opinions, idioms)
- [ ] Imperfect — things fail, characters hesitate
- [ ] Silence exists — not every moment is filled
- [ ] Emotions are SHOWN, not EXPLAINED
- [ ] At least one unique metaphor or sensory detail
- [ ] A character forgets or misremembers something

### 2026 Rules
- [ ] First 100 words = NO time/location
- [ ] 2-4 line paragraphs (mobile-friendly)
- [ ] Modern Hindi — natural, not bookish
- [ ] First 5 lines = can't be identified as AI

### Variation
- [ ] Opening type is different from last
- [ ] Concept type is different from last
- [ ] Twist type is different from last
- [ ] Character type is different from last
- [ ] Core conflict is different from last

### Timeline
- [ ] Every character's location clear at all times
- [ ] Travel time accounted for
- [ ] No unexplained gaps

### Final Test
- [ ] If this were a book — would someone believe a human wrote it?
