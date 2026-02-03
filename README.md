# 🍕 Pizza App

[![Flutter](https://img.shields.io/badge/Flutter-Create-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0-0175C2?logo=dart)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Core-FFCA28?logo=firebase)](https://firebase.google.com)
[![BLoC](https://img.shields.io/badge/State-BLoC-blue)](https://bloclibrary.dev)

## 📖 Overview

**Pizza App** is a modern, scalable, and robust mobile application built with **Flutter**. It demonstrates a production-grade implementation of a pizza ordering system, prioritizing maintainability and testability through **Clean Architecture** and the **BLoC (Business Logic Component)** pattern.

The project adopts a **Modular Architecture**, decoupling the backend logic and data repositories into separate packages (`packages/`) to ensure a strict separation of concerns between the Data Layer and the UI Layer.

---

## 📸 Screenshots

| Sign In | Home Screen | Pizza Details |
|:---:|:---:|:---:|
| ![Sign In](assets/screenshots/signin.png) | ![Home Screen](assets/screenshots/home.png) | ![Details](assets/screenshots/details.png) |

*(Note: Screenshots placeholders - add images to `assets/screenshots/`)*

---

## ✨ Key Features

### 🔐 Authentication & Security
- **Secure Auth:** Robust Email/Password authentication powered by **Firebase Auth**.
- **Advanced Validation:** Real-time, color-coded visual feedback for password strength:
  - ✅ At least 1 Uppercase
  - ✅ At least 1 Lowercase
  - ✅ At least 1 Digit
  - ✅ At least 1 Special Character
  - ✅ Min 8 Characters
- **Session Management:** deeply integrated `AuthenticationBloc` handles auto-redirection based on auth status (Authenticated vs Unauthenticated).
- **Secure Log Out:** Reliable session termination.

### 🏠 Home Screen
- **Dynamic Listing:** Real-time pizza fetching from **Cloud Firestore** displayed in a responsive Grid.
- **Smart Product Cards:**
  - **Dietary Indicators:** Visual cues for **Veg** (Green) vs **Non-Veg** (Red).
  - **Spice Levels:** Dynamic tags indicating "Bland", "Balance", or "Spicy".
  - **Pricing Logic:** Visual representation of discounts (striking through old prices).
- **Quick Actions:** "Add to Cart" functionality directly from the feed.

### 📝 Product Details
- **Rich UI:** Immersive product presentation with large imagery.
- **Macro Nutrients Analysis:** Detailed breakdown per pizza:
  - 🔥 **Calories**
  - 💪 **Protein**
  - 🛢️ **Fat**
  - 🍞 **Carbs**

---

## 🏗️ Technical Architecture

This project strictly follows **Clean Architecture** principles with a **Feature-First** and **Modular** approach.

### 📦 Modular Package Structure
To achieve loosely coupled code, the data layer is isolated in a local `packages/` directory, outside the main `lib/` folder:

- **`packages/user_repository`**: Abstraction for Authentication. It knows nothing about the UI, only how to negotiate with Firebase Auth.
- **`packages/pizza_repository`**: Manages fetching pizza data and mapping it to domain models.

### 🔄 Data Flow & Mapping
We use the **Repository Pattern** to mediate between the domain and data mapping layers:
1.  **Entities (`/entities`)**: Raw data structures representing Firestore Documents (JSON/Map).
2.  **Models (`/models`)**: Pure, immutable domain objects used by the UI.
3.  **Mappers**: `toEntity()` and `fromEntity()` methods ensure the UI never deals with raw backend data.

### ⚡ State Management (BLoC)
- **Global Scope**: `AuthenticationBloc` listens to the user session stream at the root level.
- **Feature Scope**: Dedicated BLoCs (`SignInBloc`, `SignUpBloc`, `GetPizzaBloc`) manage specific feature states.
- **Equatable**: Used for value equality to prevent unnecessary widget rebuilds.

### 📂 Directory Structure

```plaintext
lib/
├── blocs/              # Global & Feature Blocs
├── components/         # Reusable UI Widgets (MyTextField, MacroWidget)
├── screens/            # UI Screens (Auth, Home, Details)
├── app_view.dart       # Main Material App & Routing
└── main.dart           # Entry Point & Dependency Injection
packages/
├── user_repository/    # Auth Logic (Interface & Implementation)
└── pizza_repository/   # Data Logic (Interface & Implementation)
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK
- Android Studio / VS Code
- Firebase Account

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/pizza_app.git
   cd pizza_app
   ```

2. **Setup Firebase**
   - Create a project in the [Firebase Console](https://console.firebase.google.com/).
   - Add an Android App (package name is usually com.example.pizza_app).
   - Download `google-services.json`.
   - **Important:** Place `google-services.json` inside the `android/app/` directory.

3. **Install Dependencies**
   ```bash
   # Install root dependencies
   flutter pub get

   # Install package dependencies (if not auto-resolved)
   flutter pub get packages/user_repository
   flutter pub get packages/pizza_repository
   ```

4. **Run the App**
   ```bash
   flutter run
   ```

---

## 🛠️ Tech Stack & Dependencies

- **Framework:** [Flutter](https://flutter.dev/)
- **Language:** [Dart](https://dart.dev/)
- **Backend:** [Firebase Auth](https://firebase.google.com/products/auth), [Cloud Firestore](https://firebase.google.com/products/firestore)
- **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Comparison:** [equatable](https://pub.dev/packages/equatable)
- **Icons:** [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter)
