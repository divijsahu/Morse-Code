# GitHub Issues — MorseStudio

> Each issue is a single, self-contained unit of work.  
> One issue → one branch → one PR.  
> Any collaborator can pick up any open issue independently.

---

## How to Contribute

1. Comment on the issue you want to work on — wait for it to be assigned to you
2. Branch off `main` using the branch name shown on the issue
3. Open a PR that references the issue (`Closes #N`)
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
| `setup` | Project scaffolding, config |
| `design` | Visual decisions, branding |

---

## Milestones

| Milestone | Target version |
|-----------|---------------|
| `project-setup` | — |
| `morse-engine` | — |
| `converter-v1.0` | v1.0 |
| `transmission-v1.1` | v1.1 |
| `visualizer-v1.2` | v1.2 |
| `favorites-v1.3` | v1.3 |
| `practice-v1.4` | v1.4 |
| `polish-v1.5` | v1.5 |

---

## Sprint 0 — Project Shell
**Milestone:** `project-setup`

### Issue 1 — Set up Xcode project with folder structure
**Labels:** `setup`  
**Branch:** `feature/1-xcode-project-setup`  
Create the Xcode project. Add the folder structure: `App/`, `Core/Engine/`, `Core/Managers/`, `Core/Storage/`, `Features/`, `Shared/`, `Resources/`.

---

### Issue 2 — Add tab bar with placeholder screens
**Labels:** `ui`, `setup`  
**Branch:** `feature/2-tab-bar-placeholders`  
Add a tab bar with placeholder `View`s for: Converter, Transmit, Visualizer, Favorites, History, Practice, Settings.

---

### Issue 3 — Decide app name, accent color, and SF Symbol set
**Labels:** `design`  
**Branch:** `feature/3-branding`  
Finalise the app name. Set the accent color in Assets. Document the SF Symbols chosen for each tab.

---

### Issue 4 — Configure Git, README, and .gitignore
**Labels:** `setup`  
**Branch:** `feature/4-git-setup`  
Add `.gitignore` for Xcode. Write the initial README with project description, tech stack, and setup instructions.

---

### Issue 5 — Configure SwiftData stack
**Labels:** `setup`, `core`  
**Branch:** `feature/5-swiftdata-stack`  
Set up `ModelContainer` in the app entry point. Define the initial `MorseEntry` model.

---

## Sprint 1 — Morse Engine + Tests
**Milestone:** `morse-engine`

### Issue 6 — Implement `MorseEncoder` (text → morse)
**Labels:** `core`  
**Branch:** `feature/6-morse-encoder`  
Implement `MorseEncoder` that converts plain text to morse string (`... --- ...`). Handles A–Z, 0–9, punctuation, prosigns, and unknown characters gracefully.

---

### Issue 7 — Implement `MorseDecoder` (morse → text)
**Labels:** `core`  
**Branch:** `feature/7-morse-decoder`  
Implement `MorseDecoder` that converts a morse string back to plain text. Handles malformed input without crashing.

---

### Issue 8 — Write unit tests — 100% coverage on encoder and decoder
**Labels:** `testing`  
**Branch:** `feature/8-engine-unit-tests`  
Write XCTest cases covering: basic encode/decode, full codebook, empty string, unknown characters, malformed morse input, round-trip correctness.

---

### Issue 9 — Add GitHub Actions CI workflow for XCTest
**Labels:** `ci`  
**Branch:** `feature/9-github-actions-ci`  
Add a `.github/workflows/ci.yml` that runs the XCTest suite on every push and PR to `main`. Add it as a required status check on branch protection.

---

## Sprint 2 — Converter
**Milestone:** `converter-v1.0`

### Issue 10 — Build `ConverterView` with live text → morse conversion
**Labels:** `feature`, `ui`  
**Branch:** `feature/10-converter-view`  
Build `ConverterView` and `ConverterViewModel`. Live conversion as the user types. Segmented mode toggle (Text → Morse / Morse → Text).

---

### Issue 11 — Add Copy, Share, and Clear actions to Converter
**Labels:** `feature`  
**Branch:** `feature/11-converter-actions`  
Add Copy button (writes output to clipboard), Share button (system share sheet), and Clear button (resets input). All disabled when output is empty.

---

### Issue 12 — Auto-save conversions to SwiftData history with debounce
**Labels:** `feature`, `core`  
**Branch:** `feature/12-history-autosave`  
Auto-save each conversion to SwiftData after 5 seconds of inactivity (text → morse) or 10 seconds (morse → text). Cancel the pending save on each new keystroke, mode toggle, or clear. Store `isTextToMorse` on the entry.

---

### Issue 13 — Add empty state design to Converter output
**Labels:** `ui`  
**Branch:** `feature/13-converter-empty-state`  
Show a `ContentUnavailableView` in the output panel when there is no conversion yet.

---

### Issue 14 — Build `HistoryView` as a sheet from the Converter toolbar
**Labels:** `feature`, `ui`  
**Branch:** `feature/14-history-view`  
Add a clock toolbar button to `ConverterView` that opens `HistoryView` as a sheet. Each list tile shows: title (input), subtitle (output, monospaced), direction badge ("Text → Morse" / "Morse → Text"), and date/time. Swipe-to-delete per row. Clear All button in toolbar.

---

## Sprint 3 — Transmission
**Milestone:** `transmission-v1.1`

### Issue 15 — Implement `TorchManager`
**Labels:** `core`  
**Branch:** `feature/15-torch-manager`  
Implement `TorchManager` using `AVCaptureDevice`. Expose `on()`, `off()`, and `transmit(morse:wpm:)` methods. Handle devices without a torch gracefully.

---

### Issue 16 — Implement `HapticManager`
**Labels:** `core`  
**Branch:** `feature/16-haptic-manager`  
Implement `HapticManager` using `CoreHaptics`. Encode dits and dahs as vibration bursts with correct timing ratios. Fall back to `UIImpactFeedbackGenerator` if CoreHaptics is unavailable.

---

### Issue 17 — Implement `AudioManager`
**Labels:** `core`  
**Branch:** `feature/17-audio-manager`  
Implement `AudioManager` using `AVFoundation`. Generate a 700 Hz sine wave tone. Support frequency adjustment (500–900 Hz) and volume control.

---

### Issue 18 — Build `TransmitView`
**Labels:** `feature`, `ui`  
**Branch:** `feature/18-transmit-view`  
Build `TransmitView` with: mode selector (Flashlight / Haptics / Audio), Play/Stop button, WPM display, frequency slider (audio mode only), visual dot-dash animation synced to output.

---

## Sprint 3.5 — Telegraph Key Visualizer
**Milestone:** `visualizer-v1.2`

### Issue 19 — Implement dot/dash timing logic
**Labels:** `core`  
**Branch:** `feature/19-telegraph-timing-logic`  
Implement press-duration logic: < 200ms → dot, ≥ 200ms → dash. 800ms silence → complete character. 2000ms silence → add space. Expose as a `VisualizerViewModel`.

---

### Issue 20 — Build `TelegraphKeyView`
**Labels:** `ui`  
**Branch:** `feature/20-telegraph-key-view`  
Build the large tap-target key button. Animate it down on press and up on release. Trigger a rigid haptic impact on each tap.

---

### Issue 21 — Build `LEDRow` component
**Labels:** `ui`  
**Branch:** `feature/21-led-row`  
Build `LEDRow` with 5 slots. Dot = small circle, dash = wide capsule, empty = dim circle. LEDs light up immediately on tap. Add a subtle glow on the active LED.

---

### Issue 22 — Add character reveal animation
**Labels:** `ui`  
**Branch:** `feature/22-character-reveal-animation`  
After 800ms silence, reveal the decoded character with a scale + fade-in animation. Show the growing word above the key.

---

### Issue 23 — Add visual timing indicator
**Labels:** `ui`  
**Branch:** `feature/23-timing-indicator`  
Show a progress bar or fill animation while the key is held, crossing the dot/dash threshold at 200ms. The LED shape should morph from circle to capsule as the threshold is crossed.

---

### Issue 24 — Add audio feedback to telegraph key
**Labels:** `feature`  
**Branch:** `feature/24-telegraph-audio-feedback`  
Play a short beep for dot and a longer beep for dash on each key release, using `AudioManager`.

---

### Issue 25 — Add delete last symbol and Send to Converter buttons
**Labels:** `feature`  
**Branch:** `feature/25-telegraph-utility-buttons`  
Add a backspace button to delete the last tapped symbol. Add a "Send to Converter" button that passes the completed word to `ConverterView`.

---

## Sprint 4 — Favorites + Settings
**Milestone:** `favorites-v1.3`

### Issue 26 — Add favorite toggle to conversions
**Labels:** `feature`, `core`  
**Branch:** `feature/26-favorite-toggle`  
Add a star button to each history entry. Toggle `isFavorite` on `MorseEntry`. Persist via SwiftData.

---

### Issue 27 — Build `FavoritesView`
**Labels:** `feature`, `ui`  
**Branch:** `feature/27-favorites-view`  
Build `FavoritesView` showing only `isFavorite == true` entries. Add search by input text. Swipe-to-delete. Tap to reload in Converter.

---

### Issue 28 — Add clear all history option
**Labels:** `feature`  
**Branch:** `feature/28-clear-all-history`  
Add a "Clear All" destructive button to `HistoryView` toolbar that deletes all entries.

---

### Issue 29 — Build `SettingsView`
**Labels:** `feature`, `ui`  
**Branch:** `feature/29-settings-view`  
Build `SettingsView` with: default WPM, default audio frequency, default transmission mode, app theme (System / Light / Dark), haptics toggle. Persist with `@AppStorage`.

---

## Sprint 5 — Practice Mode
**Milestone:** `practice-v1.4`

### Issue 30 — Build character card learn view
**Labels:** `feature`, `ui`  
**Branch:** `feature/30-learn-character-cards`  
Show a card per character (A–Z, 0–9) with its morse pattern. Play audio + visual on tap. Track which characters have been viewed with SwiftData.

---

### Issue 31 — Build quiz mode
**Labels:** `feature`, `ui`  
**Branch:** `feature/31-quiz-mode`  
Flash a morse pattern, user types the character. Show immediate correct/incorrect feedback. Track score and streak.

---

### Issue 32 — Build tap quiz (telegraph key integration)
**Labels:** `feature`  
**Branch:** `feature/32-tap-quiz`  
Speak a letter aloud. User taps it out on the telegraph key. Score on accuracy and timing.

---

### Issue 33 — Build daily challenge
**Labels:** `feature`  
**Branch:** `feature/33-daily-challenge`  
One word per day to decode. Streak counter. Share result button. Persisted with SwiftData.

---

### Issue 34 — Build stats screen
**Labels:** `feature`, `ui`  
**Branch:** `feature/34-stats-screen`  
Show overall accuracy, characters mastered count, and best streak. Sourced from SwiftData practice records.

---

## Sprint 6 — Polish + Accessibility
**Milestone:** `polish-v1.5`

### Issue 35 — Add VoiceOver labels to all elements
**Labels:** `accessibility`  
**Branch:** `feature/35-voiceover-labels`  
Add `.accessibilityLabel` and `.accessibilityHint` to every interactive element and LED slot. Verify with VoiceOver on device.

---

### Issue 36 — Support Dynamic Type on all text
**Labels:** `accessibility`  
**Branch:** `feature/36-dynamic-type`  
Ensure all text scales correctly with Dynamic Type. Test at smallest and largest accessibility sizes.

---

### Issue 37 — Respect Reduce Motion preference
**Labels:** `accessibility`  
**Branch:** `feature/37-reduce-motion`  
Disable LED animations and character reveal transitions when `@Environment(\.accessibilityReduceMotion)` is true.

---

### Issue 38 — Ensure minimum 44×44pt tap targets
**Labels:** `accessibility`  
**Branch:** `feature/38-tap-target-sizes`  
Audit all buttons and interactive elements. Use `.frame(minWidth: 44, minHeight: 44)` or `.contentShape` where needed.

---

### Issue 39 — Profile with Instruments and fix memory leaks
**Labels:** `performance`  
**Branch:** `feature/39-instruments-profiling`  
Run Allocations and Leaks instruments. Fix any retain cycles or leaks, especially in audio and haptic managers.

---

### Issue 40 — Handle background audio correctly
**Labels:** `performance`  
**Branch:** `feature/40-background-audio`  
Configure `AVAudioSession` category correctly. Stop transmission when app backgrounds. Resume correctly on foreground.

---

### Issue 41 — Manual device testing
**Labels:** `testing`  
**Branch:** `feature/41-device-testing`  
Test on: iPhone SE (small screen), iPhone 16 Pro (Dynamic Island), iPad, dark mode, landscape, offline, low battery. Document and fix any issues found.

---

## Sprint 7 — App Store Assets + Release
**Milestone:** `polish-v1.5`

### Issue 42 — Create app icon
**Labels:** `assets`  
**Branch:** `feature/42-app-icon`  
Design and export the app icon at 1024×1024. Generate all required sizes via Xcode asset catalog.

---

### Issue 43 — Create App Store screenshots
**Labels:** `assets`  
**Branch:** `feature/43-app-store-screenshots`  
Produce screenshots for: Converter, Telegraph Key Visualizer, Practice mode. Required sizes for iPhone and iPad.

---

### Issue 44 — Record App Store preview video
**Labels:** `assets`  
**Branch:** `feature/44-preview-video`  
Record a 30-second preview video. Lead with the telegraph key demo. Export to App Store Connect specs.

---

### Issue 45 — Write App Store listing
**Labels:** `store`  
**Branch:** `feature/45-app-store-listing`  
Write name, subtitle, description (first three lines above the fold), and keywords. Research competitor keywords.

---

### Issue 46 — Add privacy policy and support URLs
**Labels:** `store`  
**Branch:** `feature/46-privacy-support-urls`  
Publish a privacy policy page. Add privacy policy URL and support URL to App Store Connect.

---

### Issue 47 — Set up TestFlight and run beta
**Labels:** `release`  
**Branch:** `feature/47-testflight-beta`  
Invite 15–20 beta testers. Run for one week. Collect feedback and file bugs as new issues.

---

### Issue 48 — Fix critical bugs from TestFlight
**Labels:** `bug`  
**Branch:** `fix/48-testflight-bugs`  
Address all critical bugs surfaced during the TestFlight beta before App Store submission.
