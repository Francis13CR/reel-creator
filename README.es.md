# Reel Creator

**Skills, reglas, prompts y plantillas portables para producir video corto con agentes de IA.**

Reel Creator es un sistema de producción agnóstico de marca para
mini-documentales, explainers, historias de datos y reels verticales 9:16.
Está pensado para que lo cargue un agente de código —OpenCode, Claude Code,
Codex, Cursor, Gemini CLI o cualquier agente que lea instrucciones Markdown— y
para mantener el mismo nivel creativo y técnico entre proyectos.

> **Read this in:** [English](README.md) · [Español](README.es.md)

## Por qué existe

La mayoría de los flujos de video con IA fallan en los mismos cuatro puntos:

1. Los visuales van detrás de la voz.
2. El centro del cuadro queda vacío, con texto sobre negro.
3. El audio suena fuerte, sucio o mal mezclado.
4. El cierre corta la última frase.

Reel Creator empaqueta las reglas que evitan esos fallos. No es un renderizador.
Es el playbook del director que se monta encima de Remotion, ffmpeg, After
Effects, CapCut o cualquier otro stack.

## Qué incluye

| Carpeta | Uso |
|---|---|
| `skills/` | Skills para agentes. Cada una es un `SKILL.md` autocontenido con trigger y flujo. |
| `rules/` | Reglas no negociables: layout, tipografía, motion, audio y QA. |
| `prompts/` | Prompt maestro para arrancar un episodio. |
| `templates/` | Tokens de marca, schemas de escena/timeline y un episodio mínimo. |
| `docs/` | Instalación para OpenCode, Claude Code, Codex y otros agentes. |
| `install.sh` | Copia las skills a la carpeta global correcta de tu agente. |

## Las reglas en una pantalla

- **9:16, 30 fps.** 1080×1920. 45–65 segundos para un mini-doc.
- **Safe zones:** 72 px laterales, 120 px arriba, **320 px abajo**. Subtítulos y
  fuente en el tercio medio-bajo, nunca pegados al borde inferior.
- **Títulos DATO:** si superan 12 caracteres, tracking positivo (`0.03em` /
  `2px`) y tamaño automático. Nunca letras encimadas ni frases truncadas.
- **Cero centros vacíos:** ninguna escena puede ser solo texto sobre negro. Cada
  beat lleva foto de archivo, matriz de puntos, objeto 3D, tablero comparativo,
  mapa táctico, tarjeta o split. Ningún centro queda estático más de 4 s.
- **Sincronía por palabra:** el gráfico entra en la palabra exacta, no en una
  estimación. Si varias escenas comparten el gráfico central, el contenedor se
  mantiene fijo y solo cambia el título. Sin fade-to-black entre ellas.
- **+1 segundo de cola:** la última frase y el fade musical terminan dentro del
  video.
- **Sonido:** voz a -14 LUFS; SFX de -18 a -22 dBFS bajo la voz. Deep booms,
  sellos secos, obturadores vintage, clicks mecánicos con low-pass, madera y
  pulsos de radar/escudo. Prohibido ruido blanco/estática, disparos reales en
  primer plano y beeps estridentes.
- **QA antes de entregar:** contact sheet, stills clave, loudness, true peak,
  cero freezes, sin texto cortado, sin centro vacío, sin cierre truncado.

La versión completa está en [`rules/production-standard.md`](rules/production-standard.md).

## Inicio rápido

```bash
git clone https://github.com/Francis13CR/reel-creator.git
cd reel-creator

# Ver opciones de instalación
./install.sh --help

# OpenCode (global)
./install.sh opencode

# Claude Code (global)
./install.sh claude

# Codex / agentes genéricos (global)
./install.sh agents
```

Después:

1. Abre el repositorio con tu agente.
2. Lee [`AGENTS.md`](AGENTS.md).
3. Completa [`templates/brand.tokens.json`](templates/brand.tokens.json) con tu
   marca.
4. Usa [`prompts/master-reel.md`](prompts/master-reel.md) para arrancar un
   episodio.
5. Pide al agente que cargue la skill `reel-director`.
6. Construye las escenas con `scene-system` y `motion-system`.
7. Mezcla el audio con `sfx-design`.
8. Corre los quality gates, extrae thumbnails y publica con
   `thumbnail-publication`.

## Compatible con OpenCode (y otros agentes)

Reel Creator usa la convención **Agent Skills**: una carpeta con un `SKILL.md` y
un `description` opcional en el frontmatter YAML. Eso lo hace portable.

### OpenCode

OpenCode V2 descubre skills en:

- global: `~/.config/opencode/skills`
- compatibilidad global: `~/.claude/skills` y `~/.agents/skills`
- proyecto: `.opencode/skills`
- compatibilidad de proyecto: `.claude/skills` y `.agents/skills`

Ejecuta:

```bash
./install.sh opencode
```

O copia a mano:

```bash
mkdir -p ~/.config/opencode/skills
cp -R skills/* ~/.config/opencode/skills/
```

También puedes agregar la carpeta explícitamente en `opencode.json`:

```jsonc
{
  "$schema": "https://opencode.ai/config.json",
  "skills": ["~/reel-creator/skills"]
}
```

Ver [`docs/opencode.md`](docs/opencode.md).

### Claude Code

```bash
./install.sh claude
# o
mkdir -p ~/.claude/skills
cp -R skills/* ~/.claude/skills/
```

Agrega `AGENTS.md` o las reglas a las instrucciones del proyecto si quieres que
las reglas que no son skills se apliquen automáticamente.

### Codex y agentes genéricos

```bash
./install.sh agents
# o
mkdir -p ~/.agents/skills
cp -R skills/* ~/.agents/skills/
```

Codex y varios agentes también leen `AGENTS.md`. Mantén el `AGENTS.md` del repo
en la raíz del proyecto donde generas el video.

### Cursor, Gemini CLI, Windsurf y otros

Copia las carpetas de `skills/` al directorio de contexto Markdown del agente, o
agrega el contenido de `rules/` y `AGENTS.md` a las instrucciones del proyecto.
Las skills son Markdown plano y no dependen de un runtime específico.

Más en [`docs/agents.md`](docs/agents.md).

## Cómo se ve un proyecto

```text
mi-video/
├── AGENTS.md
├── brand.tokens.json
├── script.md
├── scene.json
├── timeline.json
├── assets/
├── audio/
└── out/
```

No necesitas Remotion. Las reglas y skills funcionan con cualquier stack. Si usas
Remotion, las plantillas y el vocabulario de escenas mapean naturalmente a
componentes React, `Sequence`, `spring` e `interpolate`.

## Principios de diseño

1. **La imagen sirve a la frase.** El corte lo manda la voz, no un slideshow con
   temporizador fijo.
2. **Una idea por beat.** Si una escena necesita dos ideas, son dos escenas.
3. **Movimiento con intención.** Springs, easing y entradas escalonadas; nada de
   `linear` por defecto en los héroes.
4. **El sonido es la mitad del montaje.** Una mezcla limpia es parte de la
   imagen.
5. **La accesibilidad es retención.** Si el subtítulo no se lee a 360 px, no está
   terminado.
6. **Aprobación humana.** El agente redacta; el humano aprueba el guion y el
   corte final.

## Licencia

MIT. Ver [`LICENSE`](LICENSE).

La estructura original de las skills se inspiró en trabajo MIT de Charlie Hills
y del proyecto `haidrrrry/claude-remotion-skill`. Ver
[`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md).

## Versión

`v1.0.0` — primera release agnóstica de marca.
