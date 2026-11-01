# Production Standard — Reel Creator v1

This is the source of truth for any short-form video produced with Reel Creator.
It is brand-agnostic: replace the tokens with your brand's values, but keep the
gates.

## 1. Format and safe zones

- **Canvas:** 1080×1920, 30 fps.
- **Duration:** 45–65 s for a mini-documentary; 15–30 s for a data short.
- **Safe area:** 72 px sides, 120 px top, **320 px bottom**.
- **Reading area:** primary text between `y=420` and `y=1450`.
- **Captions:** keep them around `y=1520–1600`. Never place them against the
  bottom edge.
- **Source line:** around `y=1600`, above the platform UI.
- **Prohibited:** captions, source or CTA inside the bottom 320 px.

## 2. Typography

- **Display:** a condensed sans or editorial display face.
- **Body:** a readable sans.
- **Labels/data:** a mono face.
- **DATO titles:** if the title is longer than 12 characters, use
  `letter-spacing: 2px` (`0.03em`) and auto-fit the size. `line-height` 0.82–0.90.
- **Body:** 48–52 px, max 2–3 lines.
- **No truncated sentences.** If it does not fit, shorten the copy or change the
  layout. Do not shrink below legibility.
- **No collisions.** Test at 360 px wide.

## 3. Zero empty centers

- No scene may be only text on a black background.
- Every beat needs a central visual:
  - archive photo in a card;
  - dot matrix for a number;
  - 3D object;
  - comparison board / chessboard;
  - tactical map;
  - paper card with stamp or seal;
  - split screen;
  - treated B-roll.
- **3–4 second rule:** no center stays static for more than 4 seconds. It
  breathes, reveals, changes state or receives a micro-event.
- The background also needs mesh, grid, halftone, grain or vignette. Never flat
  black.

## 4. Transitions and synchronization

- **Word anchors:** if a scene depends on a phrase, anchor its start/end to the
  exact word. Do not distribute by weight when the voice dictates the cut.
- **Zero drift:** if the word starts at `10.97 s`, the scene starts at `10.97 s`
  (or with a deliberate, documented offset).
- **Shared graphic:** if several scenes share one central graphic and only the
  title changes, keep the container fixed. Do not re-mount it with `opacity: 0`.
  No fade-to-black between those scenes.
- **Frame-exact cuts:** compute each sequence as `to = round(fin × fps)` and
  `duration = to - from`. Do not round the duration separately; that creates
  one-frame gaps.
- **+1 second tail:** extend the last scene by 1 second. The voice must finish
  before the last frame and the music must fade out cleanly.

## 5. Sound

- **Voice:** -14 LUFS, true peak ≤ -1.5 dBTP.
- **Music:** -18 to -24 LUFS under the voice, with ducking.
- **SFX:** -18 to -22 dBFS under the voice.
- **Approved palette:**
  - deep cinematic boom / distant low drum;
  - dry office stamp, no white-noise tail;
  - vintage camera shutter;
  - low-pass mechanical tick for counters;
  - wooden clicks for comparison boards;
  - radar sweeps and metallic shield hit.
- **Prohibited:** white-noise radio static, real gunshots in the foreground,
  strident beeps, sirens, or any texture that masks the voice.
- **Timing:** SFX enters 2–3 frames before the visual landing; heavy impacts
  coincide with the word or the contact frame.

## 6. QA gates

Before delivery:

- [ ] 1080×1920, 30 fps, 45–65 s.
- [ ] -14 ±0.5 LUFS; TP ≤ -1.5 dBTP.
- [ ] 0 freezes; no silence >0.5 s at -40 dB.
- [ ] H.264, yuv420p, bt709, tv range, AAC 48 kHz stereo, faststart.
- [ ] Contact sheet reviewed.
- [ ] Key stills for every beat and every shared-graphic cut.
- [ ] No text cut, overlapped or outside the safe area.
- [ ] No empty center.
- [ ] SFX under the voice, no static or gunshots.
- [ ] Last sentence complete + 1 s tail.
- [ ] Sources and licenses in the description and credits.
- [ ] Human approval of the script and the final cut.

## 7. Implementation map

| Rule | Suggested implementation |
|---|---|
| Safe zones | central theme/config object |
| Captions | caption component with `paddingBottom: 400` |
| DATO titles | title component with auto-fit and tracking |
| Central visuals | reusable scene components |
| Word anchors | timeline script + schema |
| Tail | `tail_s: 1` in the episode config |
| SFX | cue list by timestamp or word |
| QA | ffprobe/ffmpeg + contact sheet |

## 8. Publication gate

Do not publish if:

1. Voice and captions are out of sync.
2. There is an empty center or a truncated text.
3. The audio has static, gunshots or an SFX above the voice.
4. The last sentence is cut.
5. The sources are missing.
