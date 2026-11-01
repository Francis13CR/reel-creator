# Audio and SFX — Reel Creator

## Voice

- Integrated loudness: **-14 LUFS**.
- True peak: **≤ -1.5 dBTP**.
- De-esser and a gentle high-pass (70–90 Hz) if needed.
- The voice is the master; everything else ducks under it.

## Music

- Bed level: **-18 to -24 LUFS** under the voice.
- Duck 6–10 dB while the voice is speaking.
- Fade in 1–2 s; fade out 3–4 s at the end.
- Use a track with a clean license and keep the license URL in the credits.

## SFX

- New cues: **-18 to -22 dBFS peak**, always below the voice.
- Enter **2–3 frames before** the visual landing.
- Keep a separate stem so cues can be audited.

### Approved palette

| Cue | Use |
|---|---|
| Deep boom / distant low drum | scene entry, split screen, reveal |
| Dry office stamp | election results, seals, decrees |
| Vintage camera shutter | archive photo entrance |
| Low-pass mechanical tick | data counters, dot matrices |
| Wooden click | chessboard / comparison pieces |
| Radar sweep | tactical map arrows |
| Metallic shield hit | defensive barrier, protection |

### Prohibited

- White-noise radio static.
- Real gunshots in the foreground.
- Strident beeps, sirens or alarms.
- Any SFX that masks the voice or creates listener fatigue.

## Sound design principles

1. **One hit per idea.** Do not stack three impacts on the same cut.
2. **Contrast, not constant noise.** Silence and music-only passages make the
   hits land.
3. **Material matters.** Stone, paper, wood and metal should sound like
   different materials.
4. **The ending is part of the mix.** The last word and the music fade must both
   finish inside the video.
5. **No static beds.** If a scene needs ambience, use tonal room tone or low
   drone, not white noise.

## QA

```bash
ffmpeg -hide_banner -i master.mp4 -af loudnorm=print_format=json -f null -
ffmpeg -hide_banner -i master.mp4 -af silencedetect=noise=-40dB:d=0.5 -f null -
ffprobe -v error -select_streams a:0 -show_entries stream=codec_name,sample_rate,channels -of default=nw=1 master.mp4
```

Check:

- integrated loudness and true peak;
- no silence >0.5 s;
- AAC 48 kHz stereo;
- last word complete;
- music fade complete.
