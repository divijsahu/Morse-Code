# App Store Screenshots — MorseStudio v1.0

---

## Required Device Sizes

| Size | Device | Resolution |
|------|--------|------------|
| 6.9" | iPhone 16 Pro Max | 1320 × 2868 px |
| 6.5" | iPhone 14 Plus / 13 Pro Max | 1284 × 2778 px |
| 5.5" | iPhone 8 Plus | 1242 × 2208 px |

> Only 6.9" is strictly required — App Store Connect will scale it for other sizes.  
> Providing 6.5" and 5.5" is recommended for best presentation.

---

## Screens to Capture (in order)

### 1 — Converter: Text → Morse
- Input: `HELLO WORLD`
- Output: `.... . .-.. .-.. --- / .-- --- .-. .-.. -..`
- Scope bar on "Text → Morse"
- Caption overlay: **"Type anything. See it in Morse instantly."**

### 2 — Converter: Morse → Text
- Input: `... --- ...`
- Output: `SOS`
- Scope bar on "Morse → Text"
- Caption overlay: **"Decode Morse back to text in real time."**

### 3 — Converter: Actions
- Show Copy and Share buttons highlighted
- Caption overlay: **"Copy, share, or clear with one tap."**

### 4 — Empty State
- Fresh launch, no input
- Caption overlay: **"Clean. Simple. Ready when you are."**

---

## How to Capture

1. Run on iPhone 16 Pro Max Simulator (for 6.9")
2. Set appearance to **Light** for screenshots 1–3, **Dark** for screenshot 4
3. Use `Cmd+S` in Simulator to save to Desktop
4. Add caption overlays in Figma or Sketch (optional but recommended)

---

## Caption Style Guide
- Font: SF Pro Display, Bold
- Size: ~60pt at 3x
- Color: White on a dark overlay, or system label on light
- Position: Upper third of the screenshot
