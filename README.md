# 🛠️ OmniTools AI - The Ultimate All-in-One Utilities App
**OmniTools AI** is a modern, modular, production-ready Flutter application built with **Clean Architecture** and **SOLID Principles**. Designed with scalability in mind, it provides an easy framework to add 100+ offline-first digital tools, calculators, and utilities with minimal setup.
---
## 🚀 Key Features
* 💎 **Material 3 & Glassmorphism UI:** Modern, clean, and responsive interface supporting both Light & Dark modes.
* ⚡ **Scalable Architecture:** Built with Clean Architecture (Feature-first structure) making adding new tools fast and independent.
* 📦 **Offline-First Storage:** Local key-value caching using **Hive** and **SharedPreferences**.
* 🎯 **State Management:** Powered by **Riverpod** and dynamic **GoRouter** navigation.
* 🔒 **Security & Privacy:** On-device local computation with standard cryptographic and privacy standards.
* 💰 **Monetization Ready:** Pre-configured architecture for **Google Mobile Ads** and **In-App Purchases (Premium)**.
---
## 🛠️ Included Tools

| Category | Tools Included |
| :--- | :--- |
| **Security & Cryptography** | Password Generator, Hash Generator (MD5, SHA-256) |
| **Developer Tools** | Base64 Encoder/Decoder, QR Code Generator |
| **Calculators & Converters** | BMI Calculator, Unit Converter |

---
## 🏗️ Tech Stack
* **Framework:** [Flutter](https://flutter.dev) (Latest Stable) & Dart Null Safety
* **State Management:** `flutter_riverpod`
* **Routing:** `go_router`
* **Database & Caching:** `hive_flutter`, `shared_preferences`
* **Networking & Hardware:** `dio`, `connectivity_plus`, `qr_flutter`, `crypto`
* **Monetization & Alerts:** `google_mobile_ads`, `flutter_local_notifications`
---
## 📂 Project Structure
```text
lib/
├── core/                  # Shared services, router, themes & constants
│   ├── constants/
│   ├── router/
│   └── services/
└── features/              # Feature-first modules
    ├── home/              # Main landing dashboard & tool lists
    └── tools/             # Independent utility modules & tools engine
