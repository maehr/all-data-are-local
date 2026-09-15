# All Data Are Local

Course materials for **All Data Are Local: Introduction to Data Literacy**, a two-day block course in Data Design + Art.

[![GitHub issues](https://img.shields.io/github/issues/maehr/all-data-are-local.svg)](https://github.com/maehr/all-data-are-local/issues)
[![GitHub forks](https://img.shields.io/github/forks/maehr/all-data-are-local.svg)](https://github.com/maehr/all-data-are-local/network)
[![GitHub stars](https://img.shields.io/github/stars/maehr/all-data-are-local.svg)](https://github.com/maehr/all-data-are-local/stargazers)
[![Code license](https://img.shields.io/github/license/maehr/all-data-are-local.svg)](https://github.com/maehr/all-data-are-local/blob/main/LICENSE-AGPL.md)
[![Data license](https://img.shields.io/github/license/maehr/all-data-are-local.svg)](https://github.com/maehr/all-data-are-local/blob/main/LICENSE-CCBY.md)
[![DOI](https://zenodo.org/badge/GITHUB_REPO_ID.svg)](https://zenodo.org/badge/latestdoi/ZENODO_RECORD)

**Course website: <https://maehr.github.io/all-data-are-local/>**

## Overview

This course introduces data literacy for Data Design + Art. It starts from one idea: data are not given. People make data through observation, selection, classification, measurement, storage, and design.

The core text is Yanni Alexander Loukissas, _All Data Are Local_. Between the two course days, students study selected sections of _Introduction to Modern Statistics (2e)_. Students also bring one dataset of their own and describe it critically.

The repository holds every public course page. Students read the published website. Teachers can fork the repository and adapt the course under the terms of the licence.

## Course At A Glance

| Item            | Value                                                                 |
| --------------- | --------------------------------------------------------------------- |
| Module          | PLAY 1 / Data Literacy, Data Design + Art                             |
| Format          | 2 days, 6 sessions per day, 60 minutes per session                    |
| Dates           | Day 1 on 5 October 2026, Day 2 on 12 October 2026                     |
| Contact time    | 12 hours                                                              |
| Instructor      | Dr. sc. Moritz Mähr                                                   |
| Core text       | Loukissas, _All Data Are Local_ (open access)                         |
| Statistics text | Çetinkaya-Rundel and Hardin, _Introduction to Modern Statistics (2e)_ |
| Assessment      | Participation, a quiz on Day 2, and a written dataset description     |
| Content licence | [CC BY 4.0](LICENSE-CCBY.md)                                          |
| Code licence    | [AGPL 3.0](LICENSE-AGPL.md)                                           |

## Repository Structure

| Path                         | Purpose                                                         |
| ---------------------------- | --------------------------------------------------------------- |
| `contents/`                  | Course pages: description, syllabus, assignments, and resources |
| `contents/sessions/`         | One page for each of the 12 sessions                            |
| `contents/cheat-sheet.qmd`   | Statistics cheat sheet, with figures built by static Python     |
| `documentation/`             | Guide for teachers who reuse the course                         |
| `assets/`                    | Images and media                                                |
| `data/`                      | Datasets, if the course publishes any                           |
| `analysis/`, `src/`, `test/` | Scripts, source code, and tests                                 |
| `project-management/`        | Planning notes and minutes                                      |

The structure follows the [Advanced Structure for Data Analysis](https://book.the-turing-way.org/project-design/pd-overview/project-repo/project-repo-advanced/) from _The Turing Way_.

## Build The Site Locally

You need Node.js 24 or later, [uv](https://docs.astral.sh/uv/), and [Quarto](https://quarto.org/).

```bash
git clone https://github.com/maehr/all-data-are-local.git
cd all-data-are-local
npm install
npm run prepare
npm run preview
```

The preview server reloads the site after each change.

## The Cheat Sheet

`contents/cheat-sheet.qmd` builds every figure with static Python. Quarto runs the `{python}` cells at build time and embeds the images, so the published site is plain HTML. Readers see figures and diagrams, not code.

Flows and relations use [Mermaid](https://mermaid.js.org/) diagrams instead of figures.

## Reuse

The course content is available under [CC BY 4.0](LICENSE-CCBY.md). You can copy it, change it, and teach it, if you give credit.

1. Fork the repository.
2. Edit the pages in `contents/`.
3. Update `_quarto.yml`, `_brand.yml`, `CITATION.cff`, and this file with your own values.
4. Enable GitHub Pages with the source **GitHub Actions**.

`documentation/index.qmd` explains the structure in more detail.

## Citation

Cite this course as described in [CITATION.cff](CITATION.cff). Archived releases and citation exports are available on [Zenodo](https://zenodo.org/record/ZENODO_RECORD) after the first release.

## Support

Dr. sc. Moritz Mähr maintains this repository. Use a public channel when you can, so that other people find the answer.

| Type                                  | Platform                                                                      |
| ------------------------------------- | ----------------------------------------------------------------------------- |
| 🚨 **Bug reports**                    | [GitHub Issues](https://github.com/maehr/all-data-are-local/issues)           |
| 📚 **Content corrections**            | [GitHub Issues](https://github.com/maehr/all-data-are-local/issues)           |
| 🎁 **Feature requests**               | [GitHub Issues](https://github.com/maehr/all-data-are-local/issues)           |
| 🛡 **Report a security vulnerability** | See [SECURITY.md](SECURITY.md)                                                |
| 💬 **General questions**              | [GitHub Discussions](https://github.com/maehr/all-data-are-local/discussions) |
| 🔒 **Private contact**                | moritz.maehr@gmail.com                                                        |

Students in the course use the module channel first.

## Contributing

Corrections, broken links, and reuse examples are welcome. Read [CONTRIBUTING.md](CONTRIBUTING.md) before you open a pull request.

## Versioning

The [repository tags](https://github.com/maehr/all-data-are-local/tags) list the versions. [Zenodo](https://zenodo.org/record/ZENODO_RECORD) lists the archived releases.

## Authors And Acknowledgment

- **Dr. sc. Moritz Mähr** — course design and materials — [maehr](https://github.com/maehr), [ORCID 0000-0002-1367-1618](https://orcid.org/0000-0002-1367-1618), <https://moritzmaehr.ch/>

See the [contributors page](https://github.com/maehr/all-data-are-local/graphs/contributors) for further contributions.

## License

Course content is released under [CC BY 4.0](LICENSE-CCBY.md). Code is released under [AGPL 3.0](LICENSE-AGPL.md).
