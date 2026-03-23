---
description: Genera un AGENTS.md completo para el proyecto actual analizando su estructura, stack y skills disponibles
---

Read the skill file at ~/.config/opencode/skills/init-agents/SKILL.md FIRST, then follow its instructions exactly.

CONTEXT:
- Working directory: !`echo -n "$(pwd)"`
- Current project: !`echo -n "$(basename $(pwd))"`

TASK:
Analyze this repository and generate a complete AGENTS.md file following the skill protocol step by step.
