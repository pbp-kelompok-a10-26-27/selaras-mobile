# SELARAS Mobile — Backend API Integration Specification

This document details the REST API endpoints exposed by `selaras-web` and consumed by `selaras-mobile`.

---

## 1. Network Environments

* **Local Machine Development:** `http://127.0.0.1:8000`
* **Android Emulator Host Loopback:** `http://10.0.2.2:8000`
* **Production Deployment (PWS):** `https://steven-dyanizha-selaras-web.pws.cs.ui.ac.id`

---

## 2. Active DRF Endpoint Specifications

### 2.1 Articles & Education
* **Route:** `GET /api/v1/articles/`
* **Response Payload Structure:**
  ```json
  [
    {
      "id": 1,
      "title": "Zero-Waste Lifestyle Starter Guide",
      "slug": "zero-waste-starter-guide",
      "summary": "Practical steps to minimize residential single-use plastics.",
      "category": "Environment",
      "tags": ["zero-waste", "sustainability"],
      "image_url": "http://127.0.0.1:8000/media/articles/cover.png"
    }
  ]
  ```

### 2.2 Green Challenges
* **Route:** `GET /api/v1/challenges/`
* **Response Payload Structure:**
  ```json
  [
    {
      "id": 1,
      "title": "Eliminate Single-Use Plastics",
      "description": "Carry reusable containers and refillable water tumblers.",
      "points": 50,
      "category": "Zero Waste",
      "streak_target": 7
    }
  ]
  ```

### 2.3 Environmental Donations
* **Route:** `GET /api/v1/donations/campaigns/`
* **Response Payload Structure:**
  ```json
  [
    {
      "id": 1,
      "title": "Mangrove Conservation Initiative",
      "target_amount": 10000000,
      "current_amount": 4500000,
      "image_url": "http://127.0.0.1:8000/media/donations/mangrove.png"
    }
  ]
  ```

### 2.4 Community Feed
* **Route:** `GET /api/v1/feeds/posts/`
* **Response Payload Structure:**
  ```json
  [
    {
      "id": 1,
      "author": "steven",
      "content": "Completed my 5th consecutive day of cycling to university!",
      "likes_count": 12,
      "comments_count": 3,
      "created_at": "2026-11-20T10:00:00Z"
    }
  ]
  ```

### 2.5 Help Desk & Support
* **Route:** `GET /api/v1/helpdesk/tickets/`
* **Response Payload Structure:**
  ```json
  [
    {
      "id": 1,
      "title": "Inquiry regarding point calculation",
      "status": "OPEN",
      "priority": "MEDIUM",
      "created_at": "2026-11-20T11:00:00Z"
    }
  ]
  ```
