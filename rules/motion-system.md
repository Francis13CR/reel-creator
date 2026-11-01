# Motion System — Reel Creator

The 10 non-negotiable rules for short-form motion. They apply to Remotion,
After Effects, Motion Canvas, Framer Motion or any frame-based system.

## The 10 rules

1. **Never linear for heroes.** Every `interpolate()` needs easing; every
   entrance prefers `spring()`. Always clamp.
2. **Entrances animate 2–3 properties together.** Opacity + translateY + scale.
   A lone fade is not an entrance.
3. **Stagger always.** Words every 3–4 frames; cards every 4–5; blocks every 6.
   Nothing enters at the same time.
4. **Exits exist and are faster than entrances.** 10–12 frames vs 18–24.
5. **Five-layer stack:** background/mesh → assets → graphics/type → grade →
   grain + vignette. Never a flat background.
6. **Every still has Ken Burns.** Video uses `<OffthreadVideo>`, not `<Video>`.
7. **Anything longer than 2 s breathes.** Sine micro-motion, 1–4 px or
   `1 ± 0.015` scale.
8. **All timing comes from fps.** No magic frame numbers; use the video config.
9. **One theme.** Colors, easings, springs and fonts come from the brand tokens.
   No inline hex.
10. **Render → frames → look → fix → re-render.** Never deliver without
    inspection.

## Timing presets

| Preset | Damping | Stiffness | Mass | Use |
|---|---:|---:|---:|---|
| entrance | 14 | 190 | 0.8 | words, cards, labels |
| weight | 18 | 120 | 1.2 | mass, camera |
| snappy | 12 | 220 | 0.7 | ticks, stamps, data |
| impact | 16 | 170 | 0.85 | hits, rebounds |
| soft | 22 | 90 | 1.0 | exits, breathing |

## Rules of weight

- **Anticipation:** before a hit, the object loads in the opposite direction for
  at least 6–10 frames.
- **Impact is not the last frame:** overshoot and settle.
- **Follow-through:** secondary parts (handle, labels, dust) follow the hero.
- **Camera:** slow, with parallax; no linear zoom.
- **No single-rotation object:** an anchor object needs at least 3 layers/parts
  with relative motion.
- **Measured contact:** for a physical hit, measure the real contact and cut the
  swing there. Do not animate collision by eye.

## Shared graphic continuity

When several scenes share the same central graphic:

- render the container outside the changing title, or keep the same local visual
  state;
- never reset the visual entrance to `opacity: 0` on the cut;
- only animate the title/text layer;
- add a continuous pulse, scan or breathing motion so the graphic never looks
  frozen;
- verify one frame on each side of the cut.

## Pre-delivery checklist

- [ ] no linear easing on heroes;
- [ ] every entrance has 2–3 properties and stagger;
- [ ] exits animated and faster;
- [ ] 5-layer stack present;
- [ ] one accent color per frame;
- [ ] text inside safe area;
- [ ] no empty center;
- [ ] shared graphic does not blink;
- [ ] stills extracted and visually inspected.
