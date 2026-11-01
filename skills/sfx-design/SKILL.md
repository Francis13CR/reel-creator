---
name: sfx-design
description: Use when adding sound effects, impact hits, stamps, counters, camera shutters, wood clicks, radar pulses or mixing a short-form video. Keeps SFX -18 to -22 dBFS under the voice and forbids noisy static or gunshots.
license: MIT
compatibility: opencode
---

# SFX Design

## Mix targets

- Voice: -14 LUFS, true peak ≤ -1.5 dBTP.
- Music: -18 to -24 LUFS under the voice, ducked.
- SFX: **-18 to -22 dBFS peak**, always below the voice.

## Approved palette

| Cue | Use |
|---|---|
| Deep boom / low drum | scene entry, split, reveal |
| Dry stamp | election result, seal, decree |
| Vintage shutter | archive photo entrance |
| Low-pass mechanical tick | data counter, dot matrix |
| Wood click | comparison board / chess pieces |
| Radar sweep | tactical map arrows |
| Metallic shield | barrier / protection |

## Scheduling

- Anchor cues to timestamps or exact words.
- Enter 2–3 frames before the visual landing.
- Do not stack three impacts on one cut.
- Keep a separate SFX stem for auditing.

## Prohibited

- White-noise radio static.
- Real gunshots in the foreground.
- Strident beeps, sirens, alarms.
- Any texture that masks the voice.

## Generate your own

You can synthesize clean SFX with Python and numpy:
- low sine sweeps with an exponential envelope → deep boom;
- modal sine bursts + a short click → stamp or wood;
- filtered noise bursts with a fast decay → paper, shutter, debris;
- sine sweeps + band-pass → radar;
- inharmonic partials → metal shield.

Normalize each file by peak to the target level. Do not use third-party samples
unless the license is documented.

## QA

```bash
ffmpeg -hide_banner -i master.mp4 -af loudnorm=print_format=json -f null -
ffmpeg -hide_banner -i master.mp4 -af silencedetect=noise=-40dB:d=0.5 -f null -
```

Check no silence >0.5 s, no clipped peaks, and a complete fade-out.
