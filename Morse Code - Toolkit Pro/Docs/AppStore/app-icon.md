# App Icon — MorseStudio v1.0

---

## Required Export

| Size | Usage |
|------|-------|
| **1024 × 1024 px** | App Store (required) |

> Xcode generates all other sizes from the 1024px asset automatically.  
> Do **not** include an alpha channel — App Store will reject it.  
> Do **not** add rounded corners — iOS applies the mask.

---

## Design Direction

### Concept
A bold morse code signal on a dark background — minimal, iconic, instantly readable at small sizes.

### Options to explore
1. **Dot-dash mark** — `· · · — — — · · ·` (SOS) arranged in a tight grid on a black background
2. **Telegraph key silhouette** — side profile of a classic telegraph key, white on black
3. **Signal pulse** — a single horizontal waveform pulse (dot-dash rhythm) centered on a dark background

### Color
- Background: `#0A0A0A` (near black) or the app's accent color
- Foreground: White or amber (`#F5A623`)
- Avoid gradients — flat icons hold up better at small sizes

### Rules
- Must be legible at 60×60 pt (iPhone home screen)
- Must be legible at 20×20 pt (notification)
- No text — icons with text are rejected or look bad small
- No transparency

---

## Xcode Setup

1. Open `Assets.xcassets/AppIcon.appiconset`
2. Drop the 1024×1024 PNG into the **App Store** slot
3. Make sure "All Sizes" is set to generate from single image
4. Build and verify the icon appears correctly in Simulator

---

## Checklist

- [ ] Icon designed at 1024×1024 px
- [ ] No alpha channel
- [ ] No rounded corners
- [ ] Looks good at 60pt (home screen)
- [ ] Looks good at 20pt (notification)
- [ ] Exported as PNG
- [ ] Added to `Assets.xcassets/AppIcon.appiconset`
- [ ] Verified in Simulator
