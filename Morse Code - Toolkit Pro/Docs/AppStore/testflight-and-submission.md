# TestFlight & Submission — MorseStudio v1.0

---

## Before Archiving

- [ ] Version: `1.0`
- [ ] Build: `1`
- [ ] Set in Xcode: Target → General → Version & Build
- [ ] Scheme set to **Release** (not Debug)
- [ ] No hardcoded simulator-only code paths
- [ ] App runs clean on a real device

---

## Archive & Upload

```
Xcode → Product → Archive
```

1. Select **Any iOS Device (arm64)** as the run destination
2. Product → Archive
3. Xcode Organizer opens automatically
4. Select the archive → **Distribute App**
5. Method: **App Store Connect**
6. Upload

---

## TestFlight Internal Test

- [ ] Build appears in App Store Connect → TestFlight
- [ ] Add yourself as internal tester
- [ ] Install via TestFlight app on real device
- [ ] Smoke test all Sprint 2 features:

```
✓ Type text → see live morse output
✓ Toggle scope bar → Morse → Text mode works
✓ Decode "... --- ..." → SOS
✓ Copy output → paste into Notes to verify
✓ Share output → share sheet appears
✓ Clear button resets both fields
✓ Tap outside input → keyboard dismisses
✓ History saves entries in background (verify via SwiftData)
✓ Dark mode → all screens look correct
✓ Empty state → shows on fresh launch
```

---

## What to Test (TestFlight Notes)
> Paste this into the "What to Test" field in App Store Connect.

```
MorseStudio v1.0 — Converter

1. Open the app — Converter tab should be active
2. Type any text in the input field — Morse output appears live
3. Tap the scope bar to switch to "Morse → Text"
4. Type "... --- ..." — output should show "SOS"
5. Tap Copy in the Output row — paste elsewhere to verify
6. Tap Share — share sheet should appear with the output
7. Tap Clear — both fields reset
8. Tap anywhere outside the input — keyboard should dismiss
9. Check that Dark Mode works correctly throughout

No login, no network requests, no permissions required.
```

---

## Submit for Review

- [ ] All metadata filled in App Store Connect
- [ ] Screenshots uploaded for all required sizes
- [ ] App icon uploaded (1024×1024, no alpha)
- [ ] Privacy policy URL added
- [ ] App privacy questionnaire completed
- [ ] Review notes added (see `app-store-connect-setup.md`)
- [ ] Click **Submit for Review**

---

## After Approval

```sh
git tag v1.0
git push origin v1.0
```

- [ ] Update `README.md` roadmap — Sprint 2 → ✅ Shipped
- [ ] Update `Morse Studio App Roadmap.md` — v1.0 status
