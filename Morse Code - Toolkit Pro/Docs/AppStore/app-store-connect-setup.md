# App Store Connect Setup — MorseStudio v1.0

Step-by-step checklist for first submission.

---

## 1. Register Bundle ID

- [ ] Go to [developer.apple.com](https://developer.apple.com) → Certificates, Identifiers & Profiles → Identifiers
- [ ] Click **+** → App IDs → App
- [ ] Description: `Morse Code Toolkit Pro`
- [ ] Bundle ID (Explicit): `com.clubsyncindia.morse`
- [ ] Capabilities: none required for v1.0
- [ ] Register

---

## 2. Create App in App Store Connect

- [ ] Go to [appstoreconnect.apple.com](https://appstoreconnect.apple.com) → My Apps → **+**
- [ ] Platform: iOS
- [ ] Name: `MorseStudio`
- [ ] Primary Language: English (U.S.)
- [ ] Bundle ID: `com.clubsyncindia.morse`
- [ ] SKU: `morse-toolkit-pro-ios` (internal only, never shown)
- [ ] User Access: Full Access

---

## 3. App Information

- [ ] Category: Utilities (primary), Education (secondary)
- [ ] Content Rights: Does not contain third-party content
- [ ] Age Rating: complete questionnaire → result is **4+**

---

## 4. Pricing & Availability

- [ ] Price: **Free**
- [ ] Availability: All countries and regions
- [ ] Pre-order: No

---

## 5. App Privacy

- [ ] Privacy Policy URL: `https://github.com/divijsahu/Morse-Code/blob/main/PRIVACY.md`
- [ ] Data Collection: **No data collected**
- [ ] Complete the privacy nutrition label — select "We do not collect data from this app"

---

## 6. Version 1.0 Submission

- [ ] Fill in all metadata from `app-store-listing.md`
- [ ] Upload screenshots from `screenshots.md`
- [ ] Upload app icon (1024×1024, no alpha)
- [ ] Set version to `1.0`, build number to `1`
- [ ] Add build from TestFlight
- [ ] Review notes for App Review team:
  ```
  MorseStudio is a Morse code converter. 
  Type text in the input field to see live Morse output.
  Toggle the scope bar to switch to Morse → Text mode.
  No login required. No network requests made.
  ```
- [ ] Additional information (Notes for App Review field):
  ```
  Morse Code Toolkit Pro is a offline Morse code converter — no account, 
  no login, and no network requests are made at any point.

  To test the app:
  1. Open the app — the Converter screen is the default tab.
  2. Type any text (e.g. "HELLO") in the input field — Morse output 
     appears live below.
  3. Tap the scope bar at the top to switch to "Morse → Text" mode.
  4. Type a Morse sequence (e.g. "... --- ...") — decoded text appears live.
  5. Tap "Copy" in the Output row to copy the result to clipboard.
  6. Tap "Share" to open the system share sheet.
  7. Tap "Clear" to reset both fields.

  All conversion history is stored locally on device using SwiftData.
  No special device configuration, hardware, or test account is required.
  The app works fully in the Simulator.
  ```
- [ ] Submit for Review

---

## 7. App Encryption Documentation

- [x] **Encryption algorithms used:** Standard encryption algorithms (uses Apple OS encryption only)
- [x] **Available for distribution in France:** No

---

## 8. After Approval

- [ ] Release manually or automatically
- [ ] Tag the release in Git: `git tag v1.0 && git push origin v1.0`
- [ ] Update README roadmap — mark Sprint 2 as shipped
- [ ] Post on social (optional)
