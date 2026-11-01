# Quality Gates — Reel Creator

Run these gates before delivery. If one fails, fix the cause and render again.

## 1. Script and fact gate

- [ ] The hook is clear in the first 2 seconds.
- [ ] Every date, name and number matches a source.
- [ ] At least 3 sources; at least 2 official or primary.
- [ ] The last sentence is complete and answers the hook.
- [ ] A human approved the script.

## 2. Visual gate

- [ ] 1080×1920, 30 fps.
- [ ] No text outside the safe area.
- [ ] No truncated sentence.
- [ ] No empty center.
- [ ] A visual change every 3–4 seconds.
- [ ] Shared graphics do not blink or fade to black.
- [ ] Contact sheet reviewed.
- [ ] One still per beat reviewed at 360 px wide.

## 3. Audio gate

- [ ] Voice -14 ±0.5 LUFS.
- [ ] True peak ≤ -1.5 dBTP.
- [ ] SFX -18 to -22 dBFS under the voice.
- [ ] No white-noise static, real gunshots or strident beeps.
- [ ] No silence >0.5 s at -40 dB.
- [ ] Music fade complete.
- [ ] Last word complete + 1 s tail.

## 4. Technical gate

- [ ] H.264, yuv420p, bt709, tv range.
- [ ] AAC 48 kHz stereo.
- [ ] `faststart` enabled.
- [ ] 0 freezes.
- [ ] Duration 45–65 s.

## 5. Publication gate

- [ ] Title, caption and CTA checked.
- [ ] Hashtags adapted per platform.
- [ ] Sources in the first comment or description.
- [ ] Thumbnail 1080×1920.
- [ ] AI/synthetic-voice disclosure checked for the platform.
- [ ] Music and SFX licenses documented.

## Commands

```bash
npm test
npm run typecheck
npm run validate -- <id> --render
npm run render -- <id>
npm run qa -- out/<id>.mp4
ffmpeg -y -i out/<id>.mp4 -vf "fps=1,scale=216:384,tile=8x8" -frames:v 1 out/contact.jpg
```

If your stack does not use npm, run the equivalent ffprobe/ffmpeg checks.
