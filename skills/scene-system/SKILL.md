---
name: scene-system
description: Use when writing or reviewing scene.json, timeline.json, shot lists or cut timing for a short-form video. Provides the generic scene vocabulary, word anchors, central visual requirement and tail rule.
license: MIT
compatibility: opencode
---

# Scene System

`scene.json` describes **what is seen**. `timeline.json` resolves **when** it
happens against the voice.

## Scene types

| Type | Use |
|---|---|
| `hook` | first 2 seconds; promise or contradiction |
| `split` | two sides, two eras, two people |
| `map` | geography, routes, borders |
| `timeline` | chronology |
| `data` | a number or range |
| `quote` | document, law, testimony |
| `compare` | before/after, military/police, old/new |
| `object` | 3D anchor object |
| `matrix` | dot grid / unit chart |
| `outro` | close, CTA, sources |

## Scene object

```json
{
  "id": "s1",
  "beat_id": "b1",
  "order": 1,
  "type": "data",
  "visual": "archive-card",
  "text": {
    "title": "2,500–3,500",
    "body": "estimated deaths"
  },
  "anchor_start": { "word": "left", "occurrence": 1, "edge": "start" },
  "anchor_end": { "word": "dead", "occurrence": 1, "edge": "end" }
}
```

## Word anchors

- `word`: normalized text, punctuation removed.
- `occurrence`: 1-based when a word repeats.
- `edge`: `start` or `end`.
- `offset_s`: deliberate adjustment in seconds.
- If a scene depends on a phrase, use an anchor. Do not distribute by estimated
  weight.

## Scene rules

- Each beat has at least one scene.
- `order` is unique within a beat.
- Every `data` scene has a central `visual`.
- No scene may be text-only on black.
- If two scenes share a visual, keep the container and change only the title.
- Add `tail_s: 1` to the episode; the last scene absorbs the tail.
- Run the timeline builder after changing anchors.

## Example episode

If the repository is available, see `templates/episode.example.json`.

## Validation

- Every scene has a valid `id`, `beat_id`, `order` and `type`.
- Every asset exists and is credited.
- Every anchor word exists in the timeline.
- The last scene ends before the final frame, with the tail applied.
