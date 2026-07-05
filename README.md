<div align="center">

# · · · — — — · · ·

# MorseStudio

**A full-featured Morse code toolkit for iPhone.**  
Convert, transmit, visualize, and learn — built entirely in SwiftUI.

<br/>

![iOS](https://img.shields.io/badge/iOS-26%2B-black?style=flat-square&logo=apple)
![Swift](https://img.shields.io/badge/Swift-6-orange?style=flat-square&logo=swift)
![SwiftUI](https://img.shields.io/badge/SwiftUI-6-blue?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)
![Built in Public](https://img.shields.io/badge/built-in%20public-blueviolet?style=flat-square)

<br/>

> Built in public as a portfolio project.  
> Every sprint ships to the App Store. Every commit is visible.

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

**Requirements:** Xcode 26+ · iOS 26+ · Swift 6

```sh
git clone https://github.com/<your-username>/morsestudio.git
cd morsestudio
open "Morse Code - Toolkit Pro.xcodeproj"
```

No package manager setup. No dependencies to install. Build and run.

---

## Roadmap

Every version is a real App Store release.

| Version | Sprint | Status |
|---------|--------|--------|
| — | Sprint 0 — Project shell | ✅ Done |
| — | Sprint 1 — Morse engine + tests | ⬜ Planned |
| `v1.0` | Sprint 2 — Converter | 🔍 In Review |
| `v1.1` | Sprint 3 — Transmission | ⬜ Planned |
| `v1.2` | Sprint 3.5 — Telegraph key visualizer | ⬜ Planned |
| `v1.3` | Sprint 4 — Favorites + settings | ⬜ Planned |
| `v1.4` | Sprint 5 — Practice mode | ⬜ Planned |
| `v1.5` | Sprint 6–7 — Polish + App Store | ⬜ Planned |


---

## Contributing

This is an open source, built-in-public project. Contributions are welcome.

Read [CONTRIBUTING.md](CONTRIBUTING.md) for the full workflow — how issues are named, how branches are created, and how PRs are merged.

---

## License

MIT © Divij Sahu
