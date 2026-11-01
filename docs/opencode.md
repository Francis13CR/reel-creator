# Using Reel Creator with OpenCode

OpenCode V2 discovers skills from these locations:

| Scope | Path |
|---|---|
| Global | `~/.config/opencode/skills` |
| Global compatibility | `~/.claude/skills`, `~/.agents/skills` |
| Project | `.opencode/skills` |
| Project compatibility | `.claude/skills`, `.agents/skills` |

Each skill is a directory with a `SKILL.md`:

```text
skills/
└── reel-director/
    └── SKILL.md
```

## Install globally

```bash
./install.sh opencode
```

This copies every folder inside `skills/` to
`~/.config/opencode/skills/`. OpenCode reloads configuration and skills without
a restart.

## Install in one project

```bash
mkdir -p .opencode/skills
cp -R /path/to/reel-creator/skills/* .opencode/skills/
```

Also copy `AGENTS.md`, `brand.tokens.json` or the relevant rules into the
project. The `AGENTS.md` file is read as project instructions.

## Add the repository as an explicit skill source

In `opencode.json` or `opencode.jsonc`:

```jsonc
{
  "$schema": "https://opencode.ai/config.json",
  "skills": ["~/reel-creator/skills"]
}
```

Relative paths in `skills` resolve from the active working directory; `~/` is
the current user's home.

## Load a skill

Mention the skill in the prompt, for example:

```text
@reel-director create a 60-second episode about the 1948 decision.
```

Or explicitly ask the agent to load `reel-director`, `scene-system`,
`motion-system`, `sfx-design` and `thumbnail-publication`.

## Notes

- The skill ID is the directory name, not the YAML `name`.
- Keep the directory names lowercase and kebab-case.
- If a project skill and a global skill share an ID, the project skill wins.
- Skills are plain Markdown, so they work with the OpenCode CLI, TUI and desktop
  app.
