# AGENTS Guidelines for This Repository

This repository holds the course website for **All Data Are Local: Introduction to Data Literacy**. The course is a two-day block course in the module PLAY 1 / Data Literacy, Data Design + Art. The site is a [Quarto](https://quarto.org/) website that GitHub Pages publishes.

The repository started from the [open-research-data-template](https://github.com/maehr/open-research-data-template). The template placeholders are resolved. Do not reintroduce them.

## 1. Use Preview Mode During Interactive Sessions

- Run `npm run preview` while you edit the documentation. The command wraps `uv run quarto preview` and reloads `.qmd`, `.md`, and asset changes.
- Keep the preview server running while you edit.
- Do not run `quarto render` in an agent session. Use it only when the maintainer asks for a production artifact.
- Do not replace the GitHub Pages workflow with manual publishing steps.

## 2. Repository Structure

The course content lives in `contents/`. The other directories follow the advanced structure from _The Turing Way_.

| Path                  | Purpose                                            |
| --------------------- | -------------------------------------------------- |
| `contents/`           | Course pages: description, syllabus, and resources |
| `contents/sessions/`  | One page for each of the 12 sessions               |
| `references.bib`      | BibTeX entries for every cited work                |
| `documentation/`      | Guidance for teachers who reuse the course         |
| `assets/`             | Images and media                                   |
| `data/`               | Datasets, if the course publishes any              |
| `analysis/`           | Notebooks and analysis scripts                     |
| `src/`                | Source code                                        |
| `test/`               | Tests for code and data                            |
| `project-management/` | Planning notes and minutes                         |

Put new files in the directory that matches their purpose.

## 3. Course Content Rules

The course pages come from source material that the instructor wrote. Accuracy matters more than style.

- Do not invent a reading, a page number, a session output, or a learning outcome.
- Keep the terms of the core text fixed: **data setting** and **local**. Never replace one with a synonym.
- Write **dataset** as one word in course prose. The core text writes it as two words, but the site uses one.
- Name the two course texts the same way on every page. The core text is Loukissas, _All Data Are Local_. The statistics text is _Introduction to Modern Statistics (2e)_.
- Each session page states the day, the duration, the reading, and the output. The subtitle carries the day and the duration. The at-a-glance callout carries the reading and the output.
- Ask the instructor before you change a date, a reading, or an assessment rule.

## 4. The Bibliography

`references.bib` holds every work the course cites. `_quarto.yml` loads it for the whole site.

- Cite a work with `@key`, or with `[-@key]` when the sentence already names the author.
- Add a page locator like `[@loukissas2019, 13–26]`. Pandoc prints the page numbers.
- `suppress-bibliography: true` in `_quarto.yml` keeps the reference list off every page.
- `contents/literature.qmd` sets `suppress-bibliography: false` and holds the only `::: {#refs}` div.
- Add an optional resource to the `nocite` list in `contents/literature.qmd`, so it appears in the list.
- The site uses Chicago author-date, which is Quarto's default. Do not add a CSL file.
- Verify a DOI, a year, and an author against the publisher before you write a new entry. Omit a field that you cannot verify.

## 5. The Cheat Sheet

`contents/cheat-sheet.qmd` builds its figures with static Python.

- Python cells use the `{python}` fence. Quarto runs them at build time and embeds the images.
- The front matter sets `echo: false`, so the page shows the figures and not the code.
- The first cell sets the chart colours and the matplotlib defaults. Later cells reuse them.
- matplotlib, numpy, and pandas are dev dependencies in `pyproject.toml`. Run `uv sync` after a clone.
- Prefer a Mermaid diagram over a Python figure for a flow, a tree, or a set of relations.
- Look at the rendered page after a change. Check that no axis label is clipped.

## 6. Writing Style

Write prose in Simplified Technical English.

- Write one instruction per sentence.
- Keep an instruction under 20 words and a description under 25 words.
- Use the active voice.
- Give one meaning to each word, and repeat the same term.
- Prefer the short common word.

These rules do not apply to source code or to quoted material.

## 7. Formatting and Linting

- Run `npm run format` before a commit. The command applies Prettier.
- Run `npm run check` to verify the formatting without a write.
- Run `uv run ruff check` to lint Python code, and `uv run ruff format` to format it.
- Run `uv run ty check` to type check Python code.

This repository contains no R code. Do not add an R toolchain, an `renv` lockfile, or an R lint step.

## 8. Commits and Changelog

- Use `git commit -m "type: subject"` with a valid Conventional Commit subject. Commitlint enforces this through Prek.
- Make one focused change per commit, so `git-cliff` can reuse the subject line.
- Run `npm run changelog:unreleased` for a compact preview.
- Run `npm run changelog` after a commit, then curate the result into `CHANGELOG.md`.

## 9. Dependency Management

### Node.js

1. Run `npm install <package>`.
2. Commit `package.json` and `package-lock.json`.
3. Run `npm run prepare` if the Git hooks are missing.

### Python

1. Edit `pyproject.toml`.
2. Run `uv sync` to refresh `uv.lock`.
3. Commit both files.

## 10. Testing and CI

- `npm run check` verifies the formatting.
- `uv run ruff check` lints Python code.
- `uv run ty check` type checks Python code.
- `npm run preview` shows rendering problems.
- `npm run lychee-check` finds dead links.
- Confirm that the workflows in `.github/workflows/` still pass after a change.

## 11. GitHub and Publishing

- The workflow `.github/workflows/quarto-publish.yml` deploys the site from `main`.
- In repository settings, Pages must use the source **GitHub Actions**.
- Run a production deployment outside an agent session, unless the maintainer authorizes it.
- Use the `workflow_dispatch` trigger only to rerun a failed deployment.

## 12. Zenodo and DOI

- Zenodo archives each GitHub release and mints a DOI.
- Run `npm run release:prepare -- --tag vX.Y.Z` before a release. Commit the generated `release-artifacts/site-vX.Y.Z.zip`.
- After the first release, record the values for `GITHUB_REPO_ID`, `ZENODO_RECORD`, and `DOI`.
- Use the concept DOI in `CITATION.cff`, because it stays stable across releases.
- `TODO.md` lists the open setup tasks.

## 13. Commands Recap

| Command                                   | Purpose                                         |
| ----------------------------------------- | ----------------------------------------------- |
| `npm run preview`                         | Preview the site with live reload               |
| `npm run check`                           | Verify the formatting                           |
| `npm run format`                          | Apply Prettier formatting                       |
| `npm run lychee-check`                    | Check links                                     |
| `uv run ruff check`                       | Lint Python code                                |
| `uv run ruff format`                      | Format Python code                              |
| `uv run ty check`                         | Type check Python code                          |
| `git commit -m "type: subject"`           | Create a Commitlint-checked Conventional Commit |
| `npm run changelog:unreleased`            | Preview the pending changelog entries           |
| `npm run changelog`                       | Generate the changelog from the commits         |
| `npm run prepare`                         | Install the Prek Git hooks                      |
| `npm run release:prepare -- --tag vX.Y.Z` | Build and stage a Zenodo-ready site archive     |
| `uv sync`                                 | Sync the Python dependencies                    |
| `quarto render`                           | Production render. Avoid it in agent sessions.  |

**Principle**: Prefer preview over production. Keep the course content accurate. Keep the build static and reproducible.
