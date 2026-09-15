# 📱 Fisha Wubshet — Flutter Portfolio Application

A modern, responsive cross-platform portfolio application built with **Flutter** and **Dart**. Designed to showcase software engineering experience, projects, technical skills, and architecture best practices across Web, Mobile, and Desktop platforms.

---

## 🚀 Key Features & Architecture Highlights

* **State Management:** Clean separation of business logic and presentation layer using predictable state management patterns (e.g., `Bloc` / `Riverpod` / `Provider`), ensuring testability and scalable state propagation across the app.
* **Responsive Layout:** Adaptive design using Flutter's layout engine (`LayoutBuilder`, flexible grids, and breakpoint constraints) to deliver a seamless user experience from mobile screens to ultra-wide web browsers.
* **Modular Clean Architecture:** Structured around feature-first / layered architecture (Data, Domain, Presentation) to maintain separation of concerns and high maintainability.
* **Smooth Animations & Micro-interactions:** Custom transitions, scroll interactions, and implicit animations designed to elevate visual feedback and UI depth.
* **Theme & UI Customization:** Centralized design system with dark/light mode switching and scalable typography scaling.

---

## 🛠️ Tech Stack & Dependencies

* **Framework:** [Flutter SDK](https://flutter.dev) (Dart)
* **State Management:** Flutter BLoC / Riverpod
* **Routing:** `go_router` / Declarative Navigation
* **HTTP & API Integration:** `dio` / `http` (for dynamic project fetching or contact handling)
* **Deployment:** GitHub Pages / Firebase Hosting / Vercel

---

## 📁 Repository Structure

```text
lib/
├── core/
│   ├── constants/       # App colors, styles, dimensions, strings
│   ├── theme/           # Light & dark theme definitions
│   └── utils/           # Helper functions, responsive screen utilities
├── features/
│   ├── home/            # Hero section, bio, quick overview
│   ├── experience/      # Work history, timeline, career journey
│   ├── projects/        # Showcase cards, tags, live links, and GitHub links
│   ├── skills/          # Tech stack breakdown and skill proficiency grids
│   └── contact/         # Contact form and social media links
├── shared/
│   ├── widgets/         # Reusable buttons, cards, navbar, and footer
│   └── state/           # Global state providers / BLoC cubits
└── main.dart            # Application entry point & route setup
