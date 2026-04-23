#!/usr/bin/env python3
"""
Create a nav-optimized logo crop: just the tree icon + "MacKenzie Tree LLC" text.
Removes the phone numbers and certification text from the bottom.
"""
from PIL import Image
import numpy as np

INPUT  = "../images/logo-transparent.png"
OUTPUT_NAV = "../images/logo-nav.png"  # Cropped for nav use

img = Image.open(INPUT).convert("RGBA")
w, h = img.size
print(f"Original: {w}x{h}")

# The logo layout (964x537):
# - Top portion (roughly 0-380px height) has the tree + main "MacKenzie Tree LLC" text
# - 380-537 has the phone numbers and certification subtitle
# Crop to keep just tree + name
crop_box = (0, 0, w, 380)  # left, top, right, bottom
nav_logo = img.crop(crop_box)

# Also trim whitespace/transparency from the right (phone numbers are far right)
nav_logo.save(OUTPUT_NAV, "PNG")
print(f"✅ Nav logo saved → {OUTPUT_NAV} ({nav_logo.size})")
