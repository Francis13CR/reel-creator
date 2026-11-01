# Reel Creator

**Portable skills, rules, prompts and templates for AI-assisted short-form video.**

Reel Creator is a brand-agnostic production system for 9:16 mini-documentaries,
explainers, data stories and social reels. It is designed to be loaded by an AI
coding agent — OpenCode, Claude Code, Codex, Cursor, Gemini CLI or any agent that
reads Markdown instructions — and to keep the same creative and technical bar
across projects.

> **Read this in:** [English](README.md) · [Español](README.es.md)

## Why this exists

Most AI video workflows fail at the same four points:

1. The visuals lag behind the voice.
2. The middle of the frame is empty text on a black background.
3. The audio is loud, noisy or badly mixed.
4. The ending cuts the last sentence.

Reel Creator packages the rules that prevent those failures. It is not a
renderer. It is the director's playbook that sits on top of Remotion, ffmpeg,
After Effects, CapCut or any other production stack.

## What is inside

| Folder | Purpose |
|---|---|
| `skills/` | Agent skills. Each one is a self-contained `SKILL.md` with a trigger and a workflow. |
| `rules/` | The non-negotiable production rules: layout, typography, motion, audio and QA. |
| `prompts/` | A master prompt for starting a new episode. |
| `templates/` | Brand tokens, scene/timeline schemas and a minimal episode example. |
| `docs/` | Installation notes for OpenCode, Claude Code, Codex and other agents. |
| `install.sh` | Copies the skills into the right global folder for your agent. |

## The rules in one screen

- **9:16, 30 fps.** 1080×1920. 45–65 seconds for a mini-doc.
- **Safe zones:** 72 px sides, 120 px top, **320 px bottom**. Captions and source
  lines live in the middle-lower third, never against the bottom edge.
- **DATO titles:** if the title is longer than 12 characters, use positive
  tracking (`0.03em` / `2px`) and auto-fit the size. Never let letters collide
  or a sentence get truncated.
- **Zero empty centers:** no scene may be only text on black. Every beat gets an
  archive photo, dot matrix, 3D object, comparison board, tactical map, paper
  card or split screen. No center stays static for more than 4 seconds.
- **Word-level sync:** graphics enter on the exact word, not on an estimate.
  When several scenes share one central graphic, keep the container fixed and
  change only the title. No fade-to-black between them.
- **+1 second tail:** the last sentence and the music fade must finish inside the
  video.
- **Sound:** voice at -14 LUFS; SFX at -18 to -22 dBFS under the voice. Use deep
  booms, dry stamps, vintage shutters, low-pass mechanical ticks, wood clicks and
  radar/shield pulses. No white-noise radio static, no real gunshots in the
  foreground, no strident beeps.
- **QA before delivery:** contact sheet, key stills, loudness, true peak, zero
  freezes, no text cut, no empty center, no truncated ending.

The full version is in [`rules/production-standard.md`](rules/production-standard.md).

## Quick start

```bash
git clone https://github.com/Francis13CR/reel-creator.git
cd reel-creator

# See where the skills can be installed
./install.sh --help

# OpenCode (global)
./install.sh opencode

# Claude Code (global)
./install.sh claude

# Codex / generic agents (global)
./install.sh agents
```

Then:

1. Open the repository with your agent.
2. Read [`AGENTS.md`](AGENTS.md).
3. Fill [`templates/brand.tokens.json`](templates/brand.tokens.json) for your
   brand.
4. Use [`prompts/master-reel.md`](prompts/master-reel.md) to start an episode.
5. Ask the agent to load the `reel-director` skill.
6. Build the scenes with `scene-system` and `motion-system`.
7. Mix the audio with `sfx-design`.
8. Run the quality gates, extract thumbnails and publish with
   `thumbnail-publication`.

## Works with OpenCode (and other agents)

Reel Creator uses the **Agent Skills** convention: a directory with a
`SKILL.md` and an optional `description` in YAML frontmatter. That makes it
portable.

### OpenCode

OpenCode V2 discovers skills in:

- global: `~/.config/opencode/skills`
- global compatibility: `~/.claude/skills` and `~/.agents/skills`
- project: `.opencode/skills`
- project compatibility: `.claude/skills` and `.agents/skills`

Run:

```bash
./install.sh opencode
```

Or copy them manually:

```bash
mkdir -p ~/.config/opencode/skills
cp -R skills/* ~/.config/opencode/skills/
```

You can also add the folder explicitly in `opencode.json`:

```jsonc
{
  "$schema": "https://opencode.ai/config.json",
  "skills": ["~/reel-creator/skills"]
}
```

See [`docs/opencode.md`](docs/opencode.md) for details.

### Claude Code

```bash
./install.sh claude
# or
mkdir -p ~/.claude/skills
cp -R skills/* ~/.claude/skills/
```

Add `AGENTS.md` or the rules to your project instructions if you want the
non-skill rules to apply automatically.

### Codex and generic agents

```bash
./install.sh agents
# or
mkdir -p ~/.agents/skills
cp -R skills/* ~/.agents/skills/
```

Codex and several other agents also read `AGENTS.md`. Keep the repository's
`AGENTS.md` at the root of the project where you generate the video.

### Cursor, Gemini CLI, Windsurf and others

Copy the `skills/` folders into the agent's Markdown context directory, or add
the contents of `rules/` and `AGENTS.md` to the project instructions. The
skills are plain Markdown and do not depend on a specific runtime.

More in [`docs/agents.md`](docs/agents.md).

## What a project looks like

```text
my-video/
├── AGENTS.md
├── brand.tokens.json
├── script.md
├── scene.json
├── timeline.json
├── assets/
├── audio/
└── out/
```

You do not need to use Remotion. The rules and skills work with any stack. If
you use Remotion, the templates and scene vocabulary map naturally to React
components, `Sequence`, `spring` and `interpolate`.

## Design principles

1. **Picture serves the sentence.** The cut is driven by the voice, not by a
   fixed slideshow timer.
2. **One idea per beat.** If a scene needs two ideas, it is two scenes.
3. **Movement with intent.** Springs, easing and staggered entrances; no linear
   default animations on heroes.
4. **Sound is half the edit.** A clean mix is part of the picture.
5. **Accessibility is retention.** If the caption cannot be read at 360 px, it
   is not finished.
6. **Human approval.** The agent drafts; the human approves the script and the
   final cut.

## License

MIT. See [`LICENSE`](LICENSE).

The original skill structure was inspired by MIT-licensed work from Charlie
Hills and the `haidrrrry/claude-remotion-skill` project. See
[`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md).

## Version

`v1.0.0` — first brand-agnostic release.
