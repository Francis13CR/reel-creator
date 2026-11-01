# Using Reel Creator with other agents

Reel Creator is plain Markdown. Any agent that can read project instructions or
skill files can use it.

## Claude Code

Global skills:

```bash
./install.sh claude
# or
mkdir -p ~/.claude/skills
cp -R skills/* ~/.claude/skills/
```

Project instructions:

```bash
cp AGENTS.md /path/to/project/AGENTS.md
```

Claude Code also reads `CLAUDE.md`; you can point it to `AGENTS.md`:

```markdown
Read AGENTS.md and rules/production-standard.md before producing video.
```

## Codex / generic agents

```bash
./install.sh agents
# or
mkdir -p ~/.agents/skills
cp -R skills/* ~/.agents/skills/
```

Keep `AGENTS.md` at the project root. Codex and several other agents use it as
the project instruction file.

## Cursor

- Add `AGENTS.md` and `rules/` to the project context.
- If your Cursor setup uses `.cursor/rules`, convert the relevant rule files to
  `.mdc` or reference them from a rule that says “read these files”.
- Copy `skills/` into the project if your Cursor version supports Markdown
  skills; otherwise keep them as reference documents.

## Gemini CLI

- Copy `AGENTS.md` to `GEMINI.md` or add a line in `GEMINI.md` pointing to it.
- Keep `rules/` in the project and mention it in the prompt.
- Copy `skills/` into the workspace if your setup supports Markdown skills.

## Windsurf

- Add `AGENTS.md` and `rules/` to the project.
- If you use `.windsurfrules`, create a short rule that says: “Read
  `AGENTS.md`, `rules/production-standard.md` and the matching `skills/*/SKILL.md`
  before writing a scene.”

## Any other agent

1. Put `AGENTS.md` at the project root.
2. Put `rules/` and `skills/` somewhere in the project.
3. In the system or project prompt, tell the agent:

```text
Read AGENTS.md, rules/production-standard.md and the relevant
skills/*/SKILL.md before producing video. Follow the quality gates.
```

4. If the agent supports tool calls, give it access to the project files so it
   can read the rules and write `scene.json`, `timeline.json` and scripts.

## Minimal portable set

If you only have one context window, use:

- `AGENTS.md`
- `rules/production-standard.md`
- `rules/quality-gates.md`
- `skills/reel-director/SKILL.md`
- `templates/brand.tokens.json`
- `prompts/master-reel.md`

That is enough to direct a short with any renderer.
