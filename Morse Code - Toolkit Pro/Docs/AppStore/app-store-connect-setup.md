# App Store Connect Setup — MorseStudio v1.0

Step-by-step checklist for first submission.

---

## 1. Register Bundle ID

- [ ] Go to [developer.apple.com](https://developer.apple.com) → Certificates, Identifiers & Profiles → Identifiers
- [ ] Click **+** → App IDs → App
- [ ] Description: `MorseStudio`
- [ ] Bundle ID (Explicit): `com.divijsahu.morsestudio`
- [ ] Capabilities: none required for v1.0
- [ ] Register

---

## 2. Create App in App Store Connect

- [ ] Go to [appstoreconnect.apple.com](https://appstoreconnect.apple.com) → My Apps → **+**
- [ ] Platform: iOS
- [ ] Name: `MorseStudio`
- [ ] Primary Language: English (U.S.)
- [ ] Bundle ID: `com.divijsahu.morsestudio`
- [ ] SKU: `morsestudio-ios` (internal only, never shown)
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
- [ ] Submit for Review

---

## 7. After Approval

- [ ] Release manually or automatically
- [ ] Tag the release in Git: `git tag v1.0 && git push origin v1.0`
- [ ] Update README roadmap — mark Sprint 2 as shipped
- [ ] Post on social (optional)
