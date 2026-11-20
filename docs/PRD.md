# SELARAS Mobile — Product Requirements Document (PRD)

> **Document Type:** Mobile Application Specification  
> **Project:** SELARAS Mobile — Sustainable Living Habit Platform  
> **Framework:** Flutter (Dart 3.x) — Multiplatform Client (Android, iOS, Web)  
> **Backend Integration:** Django REST Framework (DRF) — `selaras-web`  
> **Group:** Kelompok A10 — PBP Gasal 2026/2027  

---

## 1. Product Vision & Goals
This document defines the functional and technical specifications for the SELARAS Mobile application. The mobile client extends the SELARAS ecosystem to smartphones, delivering a responsive, tactile, and frictionless user experience for adopting sustainable everyday habits on the go.

---

## 2. Module Boundaries & Ownership

| Module | Module Owner | Primary Directory | Scope & Responsibilities |
| :--- | :--- | :--- | :--- |
| **Articles & Education** | Callista Putri Anjola (Caca) | `lib/features/articles/` | Article discovery, reading mode, tag/category filters, Eco-Score reader integration, reading habit tracker. |
| **Challenges & Weather** | Fayyad Mohammad Madani | `lib/features/challenges/` | Habit challenges catalog, daily streak tracking, completion percentage, Open-Meteo outdoor suggestions, milestone badges. |
| **Community Feed** | Joel Sheldy Sucipto | `lib/features/feed/` | Social community stream, like/comment engagement, story submission form with image uploads. |
| **Donations & Action** | Asfara Quaneisha Syafaziel (Neisha) | `lib/features/donations/` | Ecological campaign catalog, donation form, transfer receipt uploads, public donor wall. |
| **Accounts & Help Desk** | Steven Dyanizha Ananda | `lib/features/helpdesk/` | Session authentication, profile management, support ticket tracking, priority handling, FAQ viewer. |
| **Shared Core** | Joint (Lead: Steven) | `lib/core/` | Material 3 design tokens, shared layout/drawer, HTTP client foundation, CI workflow, analysis options. |

---

## 3. User Roles & Permission Matrix

| Capability | Guest Visitor | Authenticated User | Administrator |
| :--- | :---: | :---: | :---: |
| Access Home & Info Cards | Read-only | Full | Full |
| Read Published Articles | Read-only | Full | Full + Draft view |
| Participate in Challenges | View only | Join & Track Progress | Manage Challenges |
| Community Feed | View public | Like, Comment, Post | Moderation & Removal |
| Environmental Donations | View campaigns | Donate & Upload Proof | Verify Receipts |
| Help Desk Service | View FAQ | Create & Track Tickets | Respond & Close Tickets |

---

## 4. Technical Architecture Principles
1. **Feature-First Organization:** Business domains are strictly decoupled under `lib/features/` to eliminate cross-module code conflicts during parallel branch development.
2. **Shared Foundation in Core:** Domain-agnostic utilities, themes, constants, and global widgets reside under `lib/core/`.
3. **Explicit API Boundaries:** API paths are declared in `lib/core/constants/api_endpoints.dart`. Direct HTTP requests to DRF endpoints are handled exclusively within domain-specific service layers upon branching.
