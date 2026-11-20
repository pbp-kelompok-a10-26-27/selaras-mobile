# SELARAS Mobile — Architecture & Code Engineering Guidelines

> **Architecture Pattern:** Feature-First / Modular Flutter  
> **Language & Engine:** Dart 3.x / Flutter 3.x  
> **Core Principles:** Separation of Concerns (SoC) & High Cohesion, Low Coupling  

---

## 1. Feature-First Directory Structure

To promote autonomy among team members, business logic and UI are organized by **Feature Domain** rather than generic layers:

```text
lib/
├── core/                  # Domain-agnostic infrastructure
│   ├── constants/         # App constants, URLs, and Color tokens
│   ├── theme/             # Material 3 Theme setup
│   └── widgets/           # Global reusable widgets (LeftDrawer, InfoCard)
│
└── features/              # Business domain modules
    ├── home/              # Dashboard and home navigation
    ├── articles/          # Articles & Education domain (Callista)
    ├── challenges/        # Challenges & Weather domain (Fayyad)
    ├── feed/              # Community Feed domain (Joel)
    ├── donations/         # Green Donations domain (Neisha)
    └── helpdesk/          # Accounts & Help Desk domain (Steven)
```

---

## 2. Navigation & Routing Principles
1. **Global Module Navigation:** Coordinated via `LeftDrawer`, enabling users to traverse any top-level module effortlessly.
2. **Dashboard Cards:** The interactive `ItemCard`s on `MenuScreen` provide direct deep-link navigation into each module's home screen.
3. **Screen Stacking:** Standard `Navigator.push` with `MaterialPageRoute` is used to maintain native back-button navigation semantics.

---

## 3. Engineering Quality Gates
1. **Linter Enforcement:** Configured with `package:flutter_lints/flutter.yaml`.
2. **Static Code Analysis:** Every pull request must pass `flutter analyze` with 0 issues.
3. **Widget Testing:** Baseline and component regression tests reside in `test/`.
