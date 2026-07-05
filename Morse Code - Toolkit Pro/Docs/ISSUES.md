# Open Issues — MorseStudio

> Sprints 0–2 are complete and shipped.  
> Everything below is open for contribution.  
> One issue → one branch → one PR. Comment on an issue before starting work.

---

## How to Contribute

1. Comment on the issue you want — wait to be assigned
2. Branch off `main` using the branch name on the issue
3. Open a PR referencing the issue (`Closes #N`)
4. One approval required to merge

---

## Labels

| Label | Meaning |
|-------|---------|
| `core` | Engine, managers, data models |
| `feature` | User-facing functionality |
| `ui` | Layout, components, animations |
| `testing` | Unit tests, device testing |
| `ci` | GitHub Actions, automation |
| `accessibility` | VoiceOver, Dynamic Type, Reduce Motion |
| `performance` | Instruments, memory, audio |
| `assets` | App icon, screenshots, video |
| `store` | App Store listing, metadata |
| `release` | TestFlight, submission |
| `bug` | Something broken |

---

## Sprint 3 — Transmission
**Milestone:** `transmission-v1.1`

### Issue — Implement `TorchManager`
**Labels:** `core`
**Branch:** `feature/N-torch-manager`
Implement `TorchManager` using `AVCaptureDevice`. Expose `on()`, `off()`, and `transmit(morse:wpm:)`. Handle devices without a torch gracefully.

---

### Issue — Implement `HapticManager`
**Labels:** `core`
**Branch:** `feature/N-haptic-manager`
Implement `HapticManager` using `CoreHaptics`. Encode dits and dahs as vibration bursts with correct timing ratios. Fall back to `UIImpactFeedbackGenerator` if CoreHaptics is unavailable.

---

### Issue — Implement `AudioManager`
**Labels:** `core`
**Branch:** `feature/N-audio-manager`
Implement `AudioManager` using `AVFoundation`. Generate a 700 Hz sine wave tone. Support frequency adjustment (500–900 Hz) and volume control.

---

### Issue — Build `TransmitView`
**Labels:** `feature`, `ui`
**Branch:** `feature/N-transmit-view`
Build `TransmitView` with: mode selector (Flashlight / Haptics / Audio), Play/Stop button, WPM display, frequency slider (audio mode only), visual dot-dash animation synced to output.

---

## Sprint 3.5 — Telegraph Key Visualizer
**Milestone:** `visualizer-v1.2`

### Issue — Implement dot/dash timing logic
**Labels:** `core`
**Branch:** `feature/N-telegraph-timing-logic`
Press-duration logic: < 200ms → dot, ≥ 200ms → dash. 800ms silence → complete character. 2000ms silence → add space. Expose as `VisualizerViewModel`.

---

### Issue — Build `TelegraphKeyView`
**Labels:** `ui`
**Branch:** `feature/N-telegraph-key-view`
Large tap-target key button. Animate down on press, up on release. Trigger a rigid haptic impact on each tap.

---

### Issue — Build `LEDRow` component
**Labels:** `ui`
**Branch:** `feature/N-led-row`
5 LED slots. Dot = small circle, dash = wide capsule, empty = dim circle. Light up immediately on tap. Subtle glow on active LED.

---

### Issue — Add character reveal animation
**Labels:** `ui`
**Branch:** `feature/N-character-reveal-animation`
After 800ms silence, reveal the decoded character with a scale + fade-in animation. Show the growing word above the key.

---

### Issue — Add visual timing indicator
**Labels:** `ui`
**Branch:** `feature/N-timing-indicator`
Progress bar while key is held, crossing the dot/dash threshold at 200ms. LED shape morphs from circle to capsule as threshold is crossed.

---

### Issue — Add audio feedback to telegraph key
**Labels:** `feature`
**Branch:** `feature/N-telegraph-audio-feedback`
Short beep for dot, longer beep for dash on each key release, using `AudioManager`.

---

### Issue — Add delete last symbol and Send to Converter buttons
**Labels:** `feature`
**Branch:** `feature/N-telegraph-utility-buttons`
Backspace button to delete the last tapped symbol. "Send to Converter" button passes the completed word to `ConverterView`.

---

## Sprint 4 — Favorites + Settings
**Milestone:** `favorites-v1.3`

### Issue — Add favorite toggle to conversions
**Labels:** `feature`, `core`
**Branch:** `feature/N-favorite-toggle`
Star button on each history entry. Toggle `isFavorite` on `MorseEntry`. Persist via SwiftData.

---

### Issue — Build `FavoritesView`
**Labels:** `feature`, `ui`
**Branch:** `feature/N-favorites-view`
Show only `isFavorite == true` entries. Search by input text. Swipe-to-delete. Tap to reload in Converter.

---

### Issue — Build `SettingsView`
**Labels:** `feature`, `ui`
**Branch:** `feature/N-settings-view`
Default WPM, default audio frequency, default transmission mode, app theme (System / Light / Dark), haptics toggle. Persist with `@AppStorage`.

---

## Sprint 5 — Practice Mode
**Milestone:** `practice-v1.4`

### Issue — Build character card learn view
**Labels:** `feature`, `ui`
**Branch:** `feature/N-learn-character-cards`
Card per character (A–Z, 0–9) with its morse pattern. Play audio + visual on tap. Track viewed characters with SwiftData.

---

### Issue — Build quiz mode
**Labels:** `feature`, `ui`
**Branch:** `feature/N-quiz-mode`
Flash a morse pattern, user types the character. Immediate correct/incorrect feedback. Track score and streak.

---

### Issue — Build tap quiz (telegraph key integration)
**Labels:** `feature`
**Branch:** `feature/N-tap-quiz`
Speak a letter aloud. User taps it out on the telegraph key. Score on accuracy and timing.

---

### Issue — Build daily challenge
**Labels:** `feature`
**Branch:** `feature/N-daily-challenge`
One word per day to decode. Streak counter. Share result button. Persisted with SwiftData.

---

### Issue — Build stats screen
**Labels:** `feature`, `ui`
**Branch:** `feature/N-stats-screen`
Overall accuracy, characters mastered count, and best streak. Sourced from SwiftData practice records.

---

## Sprint 6 — Polish + Accessibility
**Milestone:** `polish-v1.5`

### Issue — Add VoiceOver labels to all elements
**Labels:** `accessibility`
**Branch:** `feature/N-voiceover-labels`
`.accessibilityLabel` and `.accessibilityHint` on every interactive element and LED slot. Verify with VoiceOver on device.

---

### Issue — Support Dynamic Type on all text
**Labels:** `accessibility`
**Branch:** `feature/N-dynamic-type`
All text scales correctly with Dynamic Type. Test at smallest and largest accessibility sizes.

---

### Issue — Respect Reduce Motion preference
**Labels:** `accessibility`
**Branch:** `feature/N-reduce-motion`
Disable LED and character reveal animations when `@Environment(\.accessibilityReduceMotion)` is true.

---

### Issue — Ensure minimum 44×44pt tap targets
**Labels:** `accessibility`
**Branch:** `feature/N-tap-target-sizes`
Audit all buttons. Use `.frame(minWidth: 44, minHeight: 44)` or `.contentShape` where needed.

---

### Issue — Profile with Instruments and fix memory leaks
**Labels:** `performance`
**Branch:** `feature/N-instruments-profiling`
Run Allocations and Leaks instruments. Fix retain cycles, especially in audio and haptic managers.

---

### Issue — Handle background audio correctly
**Labels:** `performance`
**Branch:** `feature/N-background-audio`
Configure `AVAudioSession` category. Stop transmission when app backgrounds. Resume on foreground.

---

### Issue — Manual device testing
**Labels:** `testing`
**Branch:** `feature/N-device-testing`
Test on: iPhone SE, iPhone 16 Pro, iPad, dark mode, landscape, offline, low battery. Document and fix issues found.

---

## Sprint 7 — App Store Assets + Release
**Milestone:** `polish-v1.5`

### Issue — Create app icon
**Labels:** `assets`
**Branch:** `feature/N-app-icon`
Design and export app icon at 1024×1024. Generate all required sizes via Xcode asset catalog.

---

### Issue — Create App Store screenshots
**Labels:** `assets`
**Branch:** `feature/N-app-store-screenshots`
Screenshots for: Converter, Telegraph Key Visualizer, Practice mode. Required sizes for iPhone and iPad.

---

### Issue — Record App Store preview video
**Labels:** `assets`
**Branch:** `feature/N-preview-video`
30-second preview video. Lead with the telegraph key demo. Export to App Store Connect specs.

---

### Issue — Write App Store listing
**Labels:** `store`
**Branch:** `feature/N-app-store-listing`
Name, subtitle, description (first three lines above the fold), and keywords. Research competitor keywords.

---

### Issue — Set up TestFlight and run beta
**Labels:** `release`
**Branch:** `feature/N-testflight-beta`
Invite 15–20 beta testers. Run for one week. File bugs as new issues.

---

### Issue — Fix critical bugs from TestFlight
**Labels:** `bug`
**Branch:** `fix/N-testflight-bugs`
Address all critical bugs from the TestFlight beta before App Store submission.
