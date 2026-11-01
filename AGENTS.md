# AGENTS.md — Reel Creator

You are working with **Reel Creator**, a portable production system for 9:16
short-form video. These instructions are mandatory for any agent that creates,
edits, reviews or publishes a video with this repository.

## Before you start

1. Read `rules/production-standard.md`.
2. Read `rules/motion-system.md`, `rules/audio-sfx.md` and
   `rules/quality-gates.md`.
3. Load the relevant skills:
   - `reel-director` for the full episode workflow.
   - `scene-system` for scene/timeline data.
   - `motion-system` for animation.
   - `sfx-design` for sound.
   - `thumbnail-publication` for covers and platform copy.
   - `brand-intake` when the brand is undefined.
4. Ask for the brand tokens if `templates/brand.tokens.json` is still empty.

## Non-negotiable rules

- **Format:** 1080×1920, 30 fps, 45–65 s for a mini-doc.
- **Safe zones:** 72 px sides, 120 px top, **320 px bottom**. Captions and
  source lines in the middle-lower third, never against the bottom edge.
- **DATO titles:** longer than 12 characters → `letter-spacing: 2px`
  (`0.03em`) and auto-fit size. No collisions, no truncated sentences.
- **Zero empty centers:** every beat needs a central visual (archive photo,
  dot matrix, 3D object, comparison board, tactical map, paper card, split
  screen or treated B-roll). No center stays static for more than 4 s.
- **Word-level sync:** scene entry is anchored to the exact word. If several
  scenes share one central graphic, keep the container fixed and change only the
  title. No fade-to-black between them.
- **+1 second tail:** the last sentence and the music fade must finish inside the
  video.
- **Sound:** voice at -14 LUFS; SFX at -18 to -22 dBFS under the voice. Use deep
  booms, dry stamps, vintage shutters, low-pass mechanical ticks, wood clicks and
  radar/shield pulses. No white-noise radio static, no real gunshots in the
  foreground, no strident beeps.
- **Human approval:** the agent never approves a script on behalf of the human.
  Draft, show, wait.

## Workflow

```text
brief → research → script → human approval → scene plan → timeline →
voice → animation → sound → render → QA → thumbnails → publication copy
```

Do not skip the approval step. Do not publish without the quality gates.

## Output shape

A project should contain:

```text
AGENTS.md
brand.tokens.json
script.md
scene.json
timeline.json
assets/
audio/
out/
```

## When something is ambiguous

Ask one question at a time. Do not invent historical facts, sources, dates,
names or quotes. If a fact cannot be verified, omit it or qualify it.

## Git hygiene

- Do not commit `.env`, secrets, `node_modules`, full renders, raw voice tracks
  or heavy intermediate frames unless the project explicitly uses Git LFS.
- Commit the source, scene/timeline JSON, brand tokens, credits, thumbnails,
  publication copy and QA report.

## References

- `rules/production-standard.md`
- `rules/motion-system.md`
- `rules/audio-sfx.md`
- `rules/quality-gates.md`
- `prompts/master-reel.md`
- `docs/agents.md`
