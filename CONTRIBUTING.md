# Contributing

Thanks for your interest in contributing to MorseStudio.
This is an open source project built in public — every issue, branch, and PR is part of the story.

New to open source? This is a great repo to start with. The codebase is pure SwiftUI + SwiftData, no third-party dependencies, and every issue is scoped to a single, well-defined task.

## Table of Contents

- [Your First Contribution](#your-first-contribution)
- [Getting Started](#getting-started)
- [Reporting Bugs](#reporting-bugs)
- [Suggesting Features](#suggesting-features)
- [Development Workflow](#development-workflow)
- [Naming Conventions](#naming-conventions)
- [Commit Messages](#commit-messages)
- [Pull Requests](#pull-requests)
- [Code Style](#code-style)

---

## Your First Contribution

Not sure where to start? Look for issues tagged [`good first issue`](https://github.com/divijsahu/Morse-Code/issues?q=is%3Aopen+label%3A%22good+first+issue%22) — these are scoped small, well-documented, and a good way to get familiar with the codebase.

The flow:
1. Find an issue tagged `good first issue`
2. Leave a comment: "I'd like to work on this"
3. Wait to be assigned (usually within 24 hours)
4. Follow the workflow below

If you get stuck at any point, ask in the issue thread — no question is too small.

---

## Getting Started

1. Fork the repository
2. Clone your fork
   ```sh
   git clone https://github.com/<your-username>/morsestudio.git
   ```
3. Open `Morse Code - Toolkit Pro.xcodeproj` in Xcode 26+
4. Build and run on a simulator or device (iOS 26+)

No external dependencies. No package manager setup needed.

---

## Reporting Bugs

Open an issue using the **Bug Report** template. Include:

- What you expected to happen
- What actually happened
- Steps to reproduce
- iOS version and device (or simulator)
- Screenshots or screen recording if relevant

---

## Suggesting Features

Open an issue using the **Feature Request** template. Include:

- The problem it solves
- Your proposed solution
- Any alternatives you considered

Check open issues first — it may already be planned on the [roadmap](Morse%20Code%20-%20Toolkit%20Pro/Docs/Dev/Morse%20Studio%20App%20Roadmap.md).

---

## Development Workflow

```
1. Open or get assigned an issue
2. Branch off main
3. Build, commit, push
4. Open a PR that references the issue
5. Squash merge → delete branch
```

`main` is always shippable. Never commit directly to it.

---

## Naming Conventions

### Issues

```
Type: Short description
```

| Type | When to use |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `chore` | Config, maintenance, tooling |
| `docs` | Documentation only |
| `refactor` | Code change with no behavior change |
| `test` | Tests only |

Examples:
- `feat: Telegraph key visualizer`
- `fix: Decoder crashes on empty input`
- `docs: Add sprint 2 notes`

### Branches

```
feature/<issue-number>-short-description
fix/<issue-number>-short-description
```

Examples:
- `feature/12-telegraph-key-visualizer`
- `fix/7-decoder-empty-input-crash`

---

## Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
type(scope): short description
```

Examples:
```
feat(visualizer): add LED row component
fix(decoder): handle empty string input
test(engine): add edge case coverage for punctuation
chore: update .gitignore
```

- Use present tense ("add" not "added")
- Keep the subject line under 72 characters
- Reference the issue in the body if needed: `Closes #12`

---

## Pull Requests

### Title

```
[#issue-number] type: same title as the issue
```

Examples:
- `[#12] feat: Telegraph key visualizer`
- `[#7] fix: Decoder crashes on empty input`

### Description

```markdown
## What
Short summary of what changed.

## Why
The issue this solves or feature this adds.

## Screenshots
<!-- Include before/after for any UI changes -->

Closes #<issue-number>
```

### Checklist before opening a PR

- [ ] Builds without warnings
- [ ] Existing tests pass
- [ ] New logic has test coverage (if applicable)
- [ ] UI changes include screenshots
- [ ] Issue is linked with `Closes #N`

---

## Code Style

- SwiftUI + MVVM — keep views dumb, logic in ViewModels
- Follow the existing folder structure under `Features/`, `Core/`, `Shared/`
- No third-party dependencies without discussion in an issue first
- Prefer `async/await` over callbacks
- Delete commented-out code before opening a PR
