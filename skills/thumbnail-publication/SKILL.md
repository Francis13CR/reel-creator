---
name: thumbnail-publication
description: Use when extracting thumbnails, writing titles, captions, CTAs or hashtags for Instagram Reels, TikTok, YouTube Shorts or Facebook Reels, or preparing the publication package.
license: MIT
compatibility: opencode
---

# Thumbnail and Publication

## Thumbnails

Extract 1–2 frames from the final master, not from the preview.

```bash
ffmpeg -y -ss 6.0 -i master.mp4 -frames:v 1 -q:v 2 thumb-hook.jpg
ffmpeg -y -ss 23.4 -i master.mp4 -frames:v 1 -q:v 2 thumb-object.jpg
```

Choose:

- **Hook frame:** the clearest conflict or promise.
- **Object frame:** the 3D anchor, map, data grid or archive photo that best
  summarizes the story.

Must be 1080×1920 JPEG/PNG, readable at 360 px wide.

## Title formulas

- “The [object/decision] that changed [place/topic]”
- “Why [unexpected fact]?”
- “The day [event] happened”
- “[Number] [unit] that explain [story]”

Avoid claims the video does not prove.

## Caption structure

1. Hook line.
2. 2–4 lines of context.
3. One concrete fact.
4. CTA to debate or comment.
5. Sources for YouTube/Facebook.

## Platform variants

### Instagram Reels

- 700–1,000 characters.
- 8–12 hashtags.
- CTA: “What would you have done? Tell me in the comments.”
- Pin a source comment.

### TikTok

- 200–400 characters.
- 5–8 hashtags.
- Hook in the first line.
- On-screen text for the first 2 seconds.

### YouTube Shorts

- Title ≤100 characters.
- Description with sources and CTA.
- 3–5 hashtags, include `#Shorts`.
- No misleading thumbnail/title.

### Facebook Reels

- 300–700 characters.
- 3–5 hashtags.
- Conversational CTA that invites respectful debate.
- Sources in the first comment.

## Publication package

Create `docs/publicacion/<episode>.md` with:

- main title and variants;
- caption per platform;
- hashtags;
- CTA;
- thumbnail paths;
- sources;
- AI/synthetic-media disclosure decision.

## AI disclosure

If the video uses synthetic voice, realistic AI video or AI-altered real people,
check the platform's disclosure flow. A synthetic voice may require an “AI info”
label even when the historical images are real. Do not label real archive as
AI-generated; describe exactly what is synthetic.
