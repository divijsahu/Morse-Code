<div align="center">

# · · · — — — · · ·

# MorseStudio

**A full-featured, open source Morse code toolkit for iPhone.**  
Convert, transmit, visualize, and learn — built entirely in SwiftUI.

<br/>

[![iOS](https://img.shields.io/badge/iOS-18%2B-black?style=flat-square&logo=apple)](https://developer.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-6-orange?style=flat-square&logo=swift)](https://swift.org)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-6-blue?style=flat-square)](https://developer.apple.com/xcode/swiftui/)
[![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square)](CONTRIBUTING.md)
[![Good First Issues](https://img.shields.io/github/issues/divijsahu/Morse-Code/good%20first%20issue?style=flat-square&label=good%20first%20issues&color=7057ff)](https://github.com/divijsahu/Morse-Code/issues?q=is%3Aopen+label%3A%22good+first+issue%22)
[![Open Issues](https://img.shields.io/github/issues/divijsahu/Morse-Code?style=flat-square)](https://github.com/divijsahu/Morse-Code/issues)
[![Built in Public](https://img.shields.io/badge/built-in%20public-blueviolet?style=flat-square)](https://github.com/divijsahu/Morse-Code)

<br/>

> Built in public as a portfolio project.  
> Every sprint ships to the App Store. Every commit is visible.  
> **Contributions welcome — see [open issues](https://github.com/divijsahu/Morse-Code/issues).**

</div>

---

## What It Does

MorseStudio is a complete Morse code toolkit — not just a converter. It lets you encode and decode text, transmit messages via flashlight, haptics, or audio, and tap out Morse on a physical telegraph key visualizer with real-time LED feedback.

| Feature | Description |
|---------|-------------|
| **Converter** | Live bidirectional text ↔ morse as you type |
| **Transmit** | Send morse via flashlight, haptics, or 700 Hz audio tone |
| **Telegraph Key** | Tap to input morse — short press dot, long press dash — with LED display |
| **Favorites** | Star and search saved conversions |
| **History** | Auto-saved conversion log with SwiftData |
| **Practice** | Learn characters, take quizzes, daily challenge |
| **Settings** | WPM, frequency, theme, haptics toggle |

---

## Telegraph Key Visualizer

The standout feature. A physical telegraph key experience on iPhone.

```
┌────────────────────────────────────┐
│                                    │
│   ●  ━  ●  ·  ·                   │  ← LED row (5 slots)
│                                    │
│           A                        │  ← Current character
│                                    │
│      H E L L O                     │  ← Word built so far
│                                    │
│   ┌──────────────────────────┐     │
│   │        TAP KEY           │     │  ← Telegraph key button
│   └──────────────────────────┘     │
│                                    │
│   ● dot    ━ dash    · empty       │
└────────────────────────────────────┘
```

Tap the key — short press for dot, long press for dash. LEDs light up in real time. When the character is complete, the letter reveals itself with an animation. It's how operators actually learned Morse code.

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| UI | SwiftUI |
| Architecture | MVVM |
| Persistence | SwiftData |
| Concurrency | async/await |
| Audio | AVFoundation |
| Haptics | Core Haptics |
| Torch | AVCaptureDevice |
| Testing | XCTest |

No third-party dependencies.

---

## Architecture

```
MorseStudio/
├── App/
├── Core/
│   ├── Engine/          ← MorseEncoder, MorseDecoder
│   ├── Managers/        ← TorchManager, HapticManager, AudioManager
│   └── Storage/         ← SwiftData models
├── Features/
│   ├── Converter/
│   ├── Transmit/
│   ├── Visualizer/      ← Telegraph key + LED display
│   ├── Favorites/
│   ├── History/
│   ├── Practice/
│   └── Settings/
├── Shared/
│   ├── Components/
│   └── Extensions/
└── Resources/
    └── Assets.xcassets
```

---

## Getting Started

**Requirements:** Xcode 16+ · iOS 18+ · Swift 6

```sh
git clone https://github.com/divijsahu/Morse-Code.git
cd Morse-Code
open "Morse Code - Toolkit Pro.xcodeproj"
```

No package manager setup. No dependencies to install. Build and run.

---

## Roadmap

Every version is a real App Store release.

| Version | Sprint | Status |
|---------|--------|--------|
| — | Sprint 0 — Project shell | ✅ Done |
| — | Sprint 1 — Morse engine + tests | ✅ Done |
| `v1.0` | Sprint 2 — Converter | ✅ Done |
| `v1.1` | Sprint 3 — Transmission | 🔨 Open for contribution |
| `v1.2` | Sprint 3.5 — Telegraph key visualizer | 🔨 Open for contribution |
| `v1.3` | Sprint 4 — Favorites + settings | 🔨 Open for contribution |
| `v1.4` | Sprint 5 — Practice mode | 🔨 Open for contribution |
| `v1.5` | Sprint 6–7 — Polish + App Store | 🔨 Open for contribution |

---

## Contributing

MorseStudio is actively looking for contributors. Whether you're an experienced iOS developer or looking for your first open source PR — there's an issue for you.

**→ [Browse open issues](https://github.com/divijsahu/Morse-Code/issues)**  
**→ [Good first issues](https://github.com/divijsahu/Morse-Code/issues?q=is%3Aopen+label%3A%22good+first+issue%22)**  
**→ [Full roadmap](Morse%20Code%20-%20Toolkit%20Pro/Docs/ISSUES.md)**

The workflow is simple:
1. Comment on an issue to get assigned
2. Branch off `main` — `feature/<issue-number>-short-description`
3. Open a PR with `Closes #N`
4. One review, then merge

Read [CONTRIBUTING.md](CONTRIBUTING.md) for the full guide.

---

## License

MIT © [Divij Sahu](https://github.com/divijsahu)
