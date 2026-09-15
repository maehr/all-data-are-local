# Copilot Instructions for This Repository

This repository holds the course website for **All Data Are Local: Introduction to Data Literacy**. The full contract is in [AGENTS.md](../AGENTS.md). Read it first. This file repeats only the points that agents get wrong most often.

## 1. Preview, do not render

- Run `npm run preview` while you edit the documentation.
- Do not run `quarto render` unless the maintainer asks for a production artifact.
- GitHub Pages deploys through `.github/workflows/quarto-publish.yml` after a validated change lands on `main`.

## 2. Do not invent course content

The course pages in `contents/` come from source material that the instructor wrote.

- Do not invent a reading, a page number, a session output, or a learning outcome.
- Keep the terms **data set**, **data setting**, and **local** fixed.
- Ask the instructor before you change a date, a reading, or an assessment rule.

## 3. This repository contains no R

Do not add an R toolchain, an `renv` lockfile, or an R lint step. The site builds with Node.js, uv, and Quarto.

## 4. The cheat sheet builds its figures with Python

`contents/cheat-sheet.qmd` uses static `{python}` cells that Quarto runs at build time. The front matter sets `echo: false`, so readers see figures and not code. Prefer a Mermaid diagram over a Python figure for a flow or a set of relations.

## 5. Use the existing validation tools

- `npm run format` and `npm run check`
- `uv run ruff format` and `uv run ruff check`
- `uv run ty check`
- `npm run lychee-check`

## 6. Write Conventional Commits

Use `git commit -m "type: subject"`. Commitlint enforces the subject through Prek. Make one focused change per commit.

## 7. Keep the setup checklist current

[TODO.md](../TODO.md) lists the open setup tasks. Work through items marked `[Agent]` directly. Prepare, but do not complete, items marked `[Shared]` or `[Manual]` without authorization.
