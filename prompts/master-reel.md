# Master prompt — new Reel Creator episode

Use this prompt in a fresh agent session. Replace the placeholders. Do not
change the rules; change only the topic, sources, brand and script.

---

Act as the director of a 9:16 mini-documentary for **{{BRAND}}**.

**Topic:** `{{TOPIC_OR_QUESTION}}`

**Format:** 1080×1920, 30 fps, 45–65 seconds. Language: `{{LANGUAGE}}`.

**Before writing:** read `AGENTS.md`, `rules/production-standard.md`,
`rules/motion-system.md`, `rules/audio-sfx.md` and
`rules/quality-gates.md`. Load the skills `reel-director`, `scene-system`,
`motion-system`, `sfx-design` and, if the brand is undefined, `brand-intake`.

**Brand:** use `brand.tokens.json`. If it is empty, run the brand intake first.

**Script:**
- 6–8 beats, 180–220 words.
- Hook in the first 2 seconds.
- One idea per beat; early payoff before 20 seconds.
- Every fact has a real source. Minimum 3 sources, 2 official/primary.
- Do not invent dates, names, numbers or quotes.
- Close by answering the hook and opening a respectful debate.
- Stop and wait for human approval before voice or final render.

**Scenes:**
- Use `scene-system`.
- Every `data` scene needs a central visual.
- If two scenes share a graphic, keep the container and change only the title.
- No text-only black scene.
- Add `tail_s: 1`.
- Anchor scene entries to exact words when the voice dictates the cut.

**Sound:**
- Voice -14 LUFS; music -18 to -24 under the voice.
- SFX -18 to -22 dBFS.
- Deep boom, dry stamp, vintage shutter, low-pass ticks, wood clicks,
  radar/shield.
- No white-noise static, no real gunshots in the foreground, no strident beeps.

**QA:**
- Contact sheet + stills of each beat and each shared cut.
- 1080×1920, 30 fps, bt709, faststart.
- -14 ±0.5 LUFS, TP ≤ -1.5 dBTP, 0 freezes.
- No empty center, no cut text, no truncated ending.
- Human approval of the final cut.

**Deliverables:**
- final MP4;
- contact sheet;
- 1–2 thumbnails;
- publication package with title, caption, CTA and hashtags per platform.
