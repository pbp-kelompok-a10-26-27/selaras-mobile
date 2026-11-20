# SELARAS Mobile — Design System

This document specifies the design tokens, color palette, typography, and reusable component guidelines for the SELARAS Flutter mobile application, directly mirroring the web design system in [`selaras-web/docs/DESIGN_SYSTEM.md`](file:///C:/Users/HP/Obsidian/academic-vault/05-PBP/selaras-web/docs/DESIGN_SYSTEM.md).

---

## 1. Color Palette & Design Tokens

Color tokens are codified in `lib/core/constants/app_colors.dart`:

### 1.1 Primary Scale (Fresh Eco Green)
* `primary300`: `#AAC46D`
* `primary400`: `#99B062`
* `primary500` *(Brand Main Seed)*: `#889D57`
* `primary600`: `#809352`
* `primary700`: `#667641`

### 1.2 Secondary Scale (Deep Forest Green)
* `secondary300`: `#5F7A4F`
* `secondary500`: `#4C623F`
* `secondary700`: `#39492F`
* `secondary800`: `#2B3724`

### 1.3 Tertiary Scale (Soft Rose Pink)
* `tertiary300`: `#F3C5CF`
* `tertiary500`: `#C29EA6`
* `tertiary700`: `#92767C`

### 1.4 Neutral & Surface Scale
* `neutralBackground`: `#FFFFFE`
* `neutralSurface`: `#F7F9F0`
* `neutralBorder`: `#E6E4DF`
* `foreground` (Primary Body Text): `#252710`
* `textMuted` (Secondary Body Text): `#595957`

---

## 2. Typography Guidelines
* **Typeface:** Plus Jakarta Sans
* **AppBar Title:** 20px, Bold, Contrast White
* **Section Heading:** 18px, Bold, Foreground Dark
* **Card Titles:** 12px, Bold
* **Body Text:** 13–14px, Regular, Muted Text

---

## 3. Reusable Component Catalog
* **InfoCard (`lib/core/widgets/info_card.dart`):** Elevated card container featuring a crisp border and structured title/content pairs for at-a-glance metrics.
* **ItemCard (`lib/features/home/widgets/item_card.dart`):** Interactive Material card incorporating InkWell touch ripples, high-contrast iconography, and floating SnackBar feedback.
* **LeftDrawer (`lib/core/widgets/left_drawer.dart`):** Global drawer navigation presenting brand headers and unified routing entries for each domain module.
