---
name: motion-system
description: Use before writing any animation, spring, transition or camera move for a short-form video. Enforces the 10 motion rules, shared-graphic continuity and the render-inspect-fix loop.
license: MIT
compatibility: opencode
---

# Motion System

## 10 non-negotiable rules

1. **Never linear for heroes.** Every interpolation has easing; entrances
   prefer springs. Always clamp.
2. **Entrances animate 2–3 properties.** Opacity + translateY + scale. A lone
   fade is not an entrance.
3. **Stagger always.** Words every 3–4 frames; cards every 4–5; blocks every 6.
4. **Exits exist and are faster.** 10–12 frames vs 18–24.
5. **Five-layer stack:** background/mesh → assets → graphics/type → grade →
   grain + vignette.
6. **Every still has Ken Burns.** Video uses a video component, not a plain
   image.
7. **Anything longer than 2 s breathes.** Sine micro-motion, 1–4 px or
   `1 ± 0.015` scale.
8. **All timing comes from fps.** No magic frames.
9. **One theme.** Tokens from `brand.tokens.json`; no inline hex.
10. **Render → frames → look → fix → re-render.** Never deliver unexamined.

## Presets

| Preset | Damping | Stiffness | Mass |
|---|---:|---:|---:|
| entrance | 14 | 190 | 0.8 |
| weight | 18 | 120 | 1.2 |
| snappy | 12 | 220 | 0.7 |
| impact | 16 | 170 | 0.85 |
| soft | 22 | 90 | 1.0 |

## Shared-graphic cuts

- Keep the central visual mounted; change only the title.
- Never reset the visual to `opacity: 0`.
- Add a pulse, scan or breathing motion.
- Verify frames on both sides of the cut.

## Verify

- Extract frames at each key beat and each shared cut.
- Look for: text cut, overlapping, empty center, black frame, flat background,
  linear heroes, simultaneous entrances, audio masking the voice.
- Fix and re-render.

For the full reference, see `rules/motion-system.md`.
