---
name: brand-intake
description: Use when starting a new short-form video project without a defined brand, or when the colors, fonts, voice, tone or visual references are missing. Produces a compact brand.md and brand.tokens.json.
license: MIT
compatibility: opencode
---

# Brand Intake

Ask only what changes the output. Prefer defaults when the user has no strong
opinion.

## Questions

1. **Audience and promise.** Who is this for, and what should they feel or learn?
2. **Palette.** One background, one text color, one accent. Optional secondary.
3. **Typography.** Display, body and mono. If unknown, pick a condensed display
   + neutral sans + mono.
4. **Voice.** Language, accent, pace, formal/informal, synthetic or human.
5. **References.** 1–3 links or stills. What exactly do you like: pace, type,
   color, sound, editing?
6. **Hard nos.** Claims, imagery, words, colors or sounds that must never appear.

## Output

Create `brand.md`:

```markdown
# Brand — <name>
- Audience:
- Promise:
- Tone:
- Palette:
- Display font:
- Body font:
- Mono font:
- Voice:
- References:
- Hard nos:
```

Create `brand.tokens.json` from `templates/brand.tokens.json`:

```json
{
  "colors": { "bg": "#0B0B0B", "text": "#F2E8D5", "accent": "#E5482F" },
  "fonts": { "display": "Anton", "body": "Archivo", "mono": "IBM Plex Mono" },
  "safe": { "top": 120, "bottom": 320, "sides": 72 }
}
```

## Rules

- Do not invent a historical photo or a logo.
- Do not use more than one dominant accent per frame.
- If the brand is already defined, skip the interview and read the tokens.
- Confirm the tokens with the user before rendering.
