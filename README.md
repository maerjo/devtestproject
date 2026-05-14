# devtestportfolio

A personal portfolio site collecting projects, notes, and experiments. Built with plain HTML/CSS and tested with Robot Framework + Playwright.

**Live site:** <https://maerjo.github.io/devtestproject/>

## Projects

- **Partikompass 2026** – An interactive guide to Swedish political parties' positions on 10 policy areas ahead of the 2026 election.
- **Robot Framework + Browser examples** – DOM checks, navigation, and accessibility smoke tests with CI via GitHub Actions.

## Quick start

```bash
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
rfbrowser install chromium
python -m http.server 8000
# open http://localhost:8000
```

## Running tests

```bash
source .venv/bin/activate
python -m http.server 8000 &
robot -d reports tests/
```

Test reports are written to `reports/` (gitignored).

## PowerShell (pwsh)

```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
pip install -r requirements.txt
rfbrowser install chromium
python -m http.server 8000
# open http://localhost:8000
```

## CI

GitHub Actions runs the Robot Framework test suite on every push and pull request to `main`. Reports are uploaded as artifacts after each run.
