# SELARAS Mobile — Sustainable Living Habit Platform

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-blue)
![Backend](https://img.shields.io/badge/Django_REST_Framework-API_v1-092E20?logo=django&logoColor=white)

**SELARAS Mobile** is a cross-platform mobile application built with Flutter, serving as the client companion for the SELARAS ecosystem. The application is designed to guide and encourage users in building, tracking, and maintaining sustainable, eco-friendly habits in their daily routines directly from their mobile devices.

This project is developed as the **second-half group project** for the Platform-Based Programming (CSGE602022) course, Odd Semester 2026/2027, Faculty of Computer Science, Universitas Indonesia.

---

## 🔗 External Links & Design Assets

* **Figma Design Link:** *(To be updated)*
* **APK Download Link:** *(To be updated)*
* **Backend Web Repository:** [`pbp-kelompok-a10-26-27/selaras-web`](https://github.com/pbp-kelompok-a10-26-27/selaras-web)
* **Web Deployment (PWS):** [https://steven-dyanizha-selaras-web.pws.cs.ui.ac.id](https://steven-dyanizha-selaras-web.pws.cs.ui.ac.id)

---

## 👥 Development Team (Group A10)

| Full Name | Student ID (NPM) | Assigned Role / Module |
| :--- | :--- | :--- |
| **Callista Putri Anjola** | 2506603740 | Articles & Education Module |
| **Joel Sheldy Sucipto** | 2506622494 | Community Feed Module |
| **Asfara Quaneisha Syafaziel** | 2506603532 | Donations & Environmental Action Module |
| **Fayyad Mohammad Madani** | 2506622720 | Challenges & Weather Advice Module |
| **Steven Dyanizha Ananda** | 2506616112 | Accounts, Help Desk & Core Infrastructure |

---

## 📌 Mobile Application Scoping & Module Breakdown

Each group member owns and maintains the user interface, state management, and API integration for their respective module:

### 1. Articles & Education (`lib/features/articles/`) — *Callista Putri Anjola*
* **Article Catalog:** Browse sustainable living guides with category filters, keyword search, and tag filtering.
* **Reader Experience:** Mobile-optimized view for deep reading, reflection, and key takeaways.
* **Eco-Score Recommendations:** Integration with Open Food Facts data linked to relevant consumption and dietary articles.
* **Reading Tracker:** Track completed articles to award green engagement points.

### 2. Challenges & Weather Guidance (`lib/features/challenges/`) — *Fayyad Mohammad Madani*
* **Challenge Catalog:** Browse daily and weekly environmental challenges (energy conservation, zero waste, single-use plastic reduction).
* **Progress Tracking & Streaks:** Log daily activities, calculate completion percentages, and maintain ongoing commitment streaks.
* **Real-time Weather Advice:** Outdoor challenge weather recommendations powered by Open-Meteo.
* **Badges & Achievements:** View awarded digital badges and milestone accomplishments.

### 3. Community Feed (`lib/features/feed/`) — *Joel Sheldy Sucipto*
* **Community Timeline:** Explore community stories, environmental progress updates, and action logs shared by peers.
* **Social Engagement:** Like posts, inspect like lists, and participate in discussion comments and replies.
* **Create Post:** Form allowing users to author new posts with descriptions and photo attachments from camera or gallery.

### 4. Donations & Green Actions (`lib/features/donations/`) — *Asfara Quaneisha Syafaziel*
* **Campaign Listings:** Browse vetted ecological initiatives requiring collective funding, accompanied by real-time progress indicators.
* **Donation Workflow:** Intuitive multi-step donation form providing bank transfer details and instructions.
* **Payment Proof Upload:** Upload receipts or payment confirmation screenshots for administrative verification.
* **Donor Wall:** Public acknowledgment wall honoring individual contributions.

### 5. Accounts, Help Desk & Core (`lib/features/helpdesk/` & `lib/core/`) — *Steven Dyanizha Ananda*
* **Authentication & Profile:** User registration, login, logout, and persistent session/cookie management.
* **Help Desk:** Support ticket submission with severity categorization, FAQ access, and ticket response tracking.
* **Shared Core Infrastructure:** Global navigation drawer, Material 3 theme system, unified API constants, error handling, and CI pipeline.

---

## 🔐 User Roles & Permissions Matrix

| Feature / Screen | Guest (Unauthenticated) | Registered User | Administrator |
| :--- | :---: | :---: | :---: |
| Home Dashboard & Information | ✅ | ✅ | ✅ |
| Browse Article Catalog | ✅ | ✅ | ✅ |
| Read Full Article Details | ✅ | ✅ | ✅ |
| View Donation Campaigns & Donor Wall | ✅ | ✅ | ✅ |
| Join Challenges & Log Daily Progress | ❌ | ✅ | ✅ |
| Engage on Community Feed (Post & Like) | ❌ | ✅ | ✅ |
| Submit Donations & Upload Payment Proof | ❌ | ✅ | ✅ |
| File Support Tickets on Help Desk | ❌ | ✅ | ✅ |
| Content Moderation & Verification | ❌ | ❌ | ✅ |

---

## 🌐 Django REST Framework (DRF) Endpoint Catalog

Backend endpoints are implemented and live on the `selaras-web` service. Mobile clients communicate with these routes using standard JSON data exchanges:

| Module | Method | Endpoint Path | Functionality |
| :--- | :---: | :--- | :--- |
| **Articles** | `GET` | `/api/v1/articles/` | Retrieve published articles, categories, tags, and thumbnails |
| **Challenges** | `GET` | `/api/v1/challenges/` | Retrieve active challenges, target categories, and point rewards |
| **Donations** | `GET` | `/api/v1/donations/campaigns/` | Retrieve donation campaigns, fundraising targets, and collected amounts |
| **Feed** | `GET` | `/api/v1/feeds/posts/` | Retrieve community feed posts, author info, like counts, and comments |
| **Help Desk** | `GET` | `/api/v1/helpdesk/tickets/` | Retrieve personal support tickets and resolution statuses |
| **Accounts** | `POST` | `/accounts/login/` | Authenticate user credentials and establish session cookie |
| **Accounts** | `POST` | `/accounts/register/` | Register new user account |
| **Accounts** | `POST` | `/accounts/logout/` | Terminate active user session |

> **Network Configuration Note:** Local backend runs on `http://127.0.0.1:8000` (or `http://10.0.2.2:8000` when executing inside the Android Emulator). The production backend is accessible at `https://steven-dyanizha-selaras-web.pws.cs.ui.ac.id`.

---

## 🛠️ Local Development Setup

### Prerequisites
1. **Flutter SDK** (Version 3.x or latest stable)
2. **Dart SDK** (Bundled with Flutter)
3. **Android Studio** & Android SDK (or **Google Chrome** for rapid web execution)
4. **Git**

### Installation & Run Instructions
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/pbp-kelompok-a10-26-27/selaras-mobile.git
   cd selaras-mobile
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Verify Code Quality:**
   ```bash
   flutter analyze
   ```

4. **Execute Tests:**
   ```bash
   flutter test
   ```

5. **Run Application:**
   * Target Google Chrome:
     ```bash
     flutter run -d chrome
     ```
   * Target Connected Android Device / Emulator:
     ```bash
     flutter run
     ```

---

## 🌿 Collaborative Git Workflow & Branching Strategy

To guarantee codebase stability on the primary branch (`main`), all module-specific developments must be conducted on isolated feature branches:

1. The `main` branch represents production-ready code.
2. Team members branch off `main` using standardized naming:
   * `feat/articles-<member_name>`
   * `feat/challenges-<member_name>`
   * `feat/feed-<member_name>`
   * `feat/donations-<member_name>`
   * `feat/helpdesk-<member_name>`
3. Prior to submitting a Pull Request (PR) into `main`, verify that `flutter analyze` reports `No issues found!`.
