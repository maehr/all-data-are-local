# Setup Checklist

The course site is built and the template placeholders are resolved. The tasks below still need a human, or need a published release.

## Owner Labels

| Label      | Meaning                                                                       |
| ---------- | ----------------------------------------------------------------------------- |
| `[Agent]`  | A coding agent can do this directly in the repository.                        |
| `[Shared]` | An agent can prepare the work, but a maintainer approves the external action. |
| `[Manual]` | Complete this in GitHub, Zenodo, or another external service.                 |

## Open Tasks

### Metadata

- [ ] `[Agent]` Replace the template favicons at the repository root: `favicon.ico`, `favicon-16x16.png`, `favicon-32x32.png`, `apple-touch-icon.png`, `android-chrome-192x192.png`, and `android-chrome-512x512.png`.
- [ ] `[Agent]` Set the course colours and fonts in `_brand.yml`. See the [brand.yml guide](https://quarto.org/docs/authoring/brand.html).

### GitHub

- [x] `[Manual]` Enable GitHub Pages in the repository settings with **Source: GitHub Actions**. Done. The site is live at <https://maehr.github.io/all-data-are-local/>.
- [x] `[Shared]` Enable GitHub security alerts and Dependabot security updates. Done, with secret scanning and push protection.
- [x] `[Shared]` Protect the `main` branch. Done. A pull request and passing checks are required. Force pushes and deletions are blocked. Required approvals are set to 0, because one person maintains the repository. Raise the count when a second maintainer joins.

### Zenodo and DOI

- [ ] `[Manual]` Enable the Zenodo-GitHub integration, so that Zenodo archives each release and mints a DOI.
- [ ] `[Agent]` Replace `GITHUB_REPO_ID` in `README.md` with the numeric repository ID. Read the `id` field from `https://api.github.com/repos/maehr/all-data-are-local`.
- [ ] `[Shared]` Prepare a release archive with `npm run release:prepare -- --tag vX.Y.Z`. Commit the generated `release-artifacts/site-vX.Y.Z.zip`.
- [ ] `[Shared]` After the first release, replace `DOI` in `CITATION.cff` and `ZENODO_RECORD` in `README.md`. Use the concept DOI, because it stays stable across releases.

### Course content

- [ ] `[Manual]` Confirm the subtitle of the statistics cheat sheet. The source file said "BA Arts and Information Design". The rest of the course says "Data Design + Art". The site now uses "Data Design + Art".
- [ ] `[Manual]` Write the multiple-choice quiz for [Session 7](contents/sessions/07-statistics-knowledge-check.qmd). No source material exists for it yet.

## Validation

Run these commands before you push.

| Command                | Purpose                   |
| ---------------------- | ------------------------- |
| `npm run format`       | Apply Prettier formatting |
| `npm run check`        | Verify the formatting     |
| `npm run preview`      | Find rendering problems   |
| `npm run lychee-check` | Find dead links           |
| `uv run ruff check`    | Lint Python code          |

Look at `contents/cheat-sheet.qmd` in the preview after a change. Check that every figure draws and that no axis label is clipped.
