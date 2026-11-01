---
name: reel-director
description: Use when creating a new 9:16 short, mini-documentary, explainer or data story from a topic, brief or script. Runs the full workflow from research and script approval to scene plan, render, QA and publication package.
license: MIT
compatibility: opencode
---

# Reel Director

You are the director of a 45–65 second vertical video. The agent drafts; the
human approves.

## 1. Brief

Collect or infer:

- topic and promise;
- audience;
- language and tone;
- duration target;
- must-use facts and must-avoid claims;
- brand tokens or `brand-intake`.

## 2. Research

- Verify every date, name and number with at least one reliable source.
- Prefer primary/official sources.
- Keep a `sources.json` or a sources section in the script.
- If a fact cannot be verified, omit it or qualify it. Never invent.

## 3. Script

- 6–8 beats, 180–220 words for 45–65 s.
- Hook in the first 2 seconds.
- One idea per beat.
- Early payoff before 20 seconds.
- Close by answering the hook and opening a respectful debate.
- Mark each beat with a visual idea.

Example beat sheet:

| Beat | Voice | Visual |
|---|---|---|
| 1 | Hook | bold statement + archive/texture |
| 2 | Context | map or split |
| 3 | Turn | data matrix |
| 4 | Proof | paper card / document |
| 5 | Consequence | comparison board |
| 6 | Close | tactical map / outro |

Stop and ask for human approval of the script before generating voice or final
animation.

## 4. Scene plan

Use `scene-system`. Every `DATO` scene needs a central visual. If two scenes
share the same graphic, keep the container and change only the title.

## 5. Timeline

- Anchor scene starts/ends to words when the voice dictates the cut.
- Add a 1-second tail (`tail_s: 1`).
- Ensure no frame gaps at cuts.

## 6. Render

- 1080×1920, 30 fps.
- 5-layer visual stack.
- Motion rules from `motion-system`.
- Sound from `sfx-design`.
- Review 3–5 key stills before rendering the full video.

## 7. QA

Run the quality gates and audio checks. If the Reel Creator repository is available, read `rules/quality-gates.md` and `rules/audio-sfx.md`. Do not deliver if:

- the last sentence is cut;
- a center is empty;
- text is truncated;
- a shared graphic blinks;
- SFX covers the voice;
- loudness or true peak is out of range.

## 8. Deliverables

- final MP4 (1080×1920, H.264/AAC, bt709, faststart);
- contact sheet;
- 1–2 thumbnails;
- publication copy per platform;
- sources and licenses.

## Rules

- The agent never approves its own script.
- No AI-generated historical photos.
- No text-only black scenes.
- No static covers for the video.
