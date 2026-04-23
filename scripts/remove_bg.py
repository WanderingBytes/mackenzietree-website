#!/usr/bin/env python3
"""
Remove white/light background from MacKenzie Tree logo.
Creates a clean transparent PNG suitable for use on any background.
"""
from PIL import Image
import numpy as np

INPUT  = "../images/real/logo.png"
OUTPUT = "../images/logo-transparent.png"

# Open image and ensure RGBA mode
img = Image.open(INPUT).convert("RGBA")
data = np.array(img, dtype=float)

r, g, b, a = data[:,:,0], data[:,:,1], data[:,:,2], data[:,:,3]

# --- Strategy: flood-fill style white removal ---
# Pixels that are "white-ish" (near-white) will be made transparent.
# We also want to preserve soft anti-aliased edges by using partial transparency.

# Calculate "whiteness" as distance from pure white (255,255,255)
whiteness = np.sqrt(((r - 255)**2 + (g - 255)**2 + (b - 255)**2) / 3)

# Threshold tuning:
#   whiteness < 20  → fully transparent (clearly background)
#   whiteness 20-60 → partial transparency (anti-aliased edges)
#   whiteness > 60  → fully opaque (logo content)
HARD_TRANSPARENT = 20
SOFT_EDGE        = 65

alpha_mask = np.clip((whiteness - HARD_TRANSPARENT) / (SOFT_EDGE - HARD_TRANSPARENT), 0, 1)
alpha_new  = (alpha_mask * 255).astype(np.uint8)

# Apply new alpha
result = np.array(img)
result[:,:,3] = alpha_new

# Save
out_img = Image.fromarray(result, "RGBA")
out_img.save(OUTPUT, "PNG")
print(f"✅ Saved transparent logo → {OUTPUT}")
print(f"   Size: {out_img.size}")
