# 🎉 Evently

## 📅 Evently

**Evently** is a modern Flutter event management application designed to help users **discover, create, organize, and manage events** through a clean and user-friendly interface.

The application was developed by **Eng. Omar Ahmed Ali** as a Flutter project under the supervision of **Mohamed Nabil**.

## ✨ Features

### 🚀 Onboarding

* Introduction screens
* Language selection
* Theme selection
* Onboarding flow

### 🔐 Authentication

* Login
* Register
* Forget Password
* Google Sign-In
* Secure Logout
* Firebase Authentication

### 🏠 Home

* Browse upcoming events
* Search for events
* Browse event categories
* Filter events by category
* Add new events
* View event details

### ❤️ Favorites

* Add events to favorites
* Remove events from favorites
* View favorite events
* Synchronize favorite state with Firestore

### 👤 Profile & Settings

* View user profile
* Change application language
* Light & Dark Mode
* Logout

### 📅 Event Management

* Add Event
* View Event Details
* Edit Event
* Delete Event
* Select Date
* Select Time
* Add Event Description
* Add Event Location
* Select Event Category

### 🌐 Localization

* English
* Arabic
* RTL support
* Save selected language using **SharedPreferences**

### 🌓 Theme

* Light Mode
* Dark Mode
* Save selected theme using **SharedPreferences**
* Theme management using **Provider**

## 🏗️ Architecture & Development Practices

The application was developed using clean and maintainable coding practices.

* **Clean Architecture**
* **SOLID Principles**
* **Provider State Management**
* Separation of Concerns
* Reusable Components
* Responsive UI
* Firebase Integration
* Local Data Persistence
* Localization
* Error Handling
* Clean Code

## 🛠️ Built With

* **Flutter & Dart**
* **Firebase Core** — Firebase initialization
* **Firebase Authentication** — User authentication
* **Cloud Firestore** — Cloud database
* **Google Sign-In** — Google authentication
* **Provider** — State Management
* **SharedPreferences** — Local data persistence
* **Flutter ScreenUtil** — Responsive UI
* **Flutter Localizations** — Localization
* **Intl** — Internationalization and date formatting
* **Google Fonts** — Custom fonts
* **Introduction Screen** — Onboarding
* **Flutter Animate** — UI animations
* **Fluttertoast** — Toast notifications

## ☁️ Firebase Integration

The application uses **Firebase** for authentication and cloud data management.

### 🔐 Firebase Authentication

Firebase Authentication is used for:

* Email & Password Login
* User Registration
* Password Reset
* Google Sign-In
* Secure Logout

### ☁️ Cloud Firestore

Cloud Firestore is used for:

* Storing user information
* Storing events
* Managing event data
* Managing favorite events
* Updating and deleting events
* Associating events with authenticated users

## 📱 Event Categories

The application supports different event categories, including:

* **Sport**
* **Birthday**
* **Meeting**
* **Book Club**
* **Exhibition**

## 💾 Local Storage

**SharedPreferences** is used to save user preferences locally, including:

* Selected language
* Selected theme
* Onboarding state

The saved preferences are restored when the application starts again.

## 🎨 UI & Responsive Design

The application uses **Flutter ScreenUtil** to provide a responsive user interface across different screen sizes.

The project also uses:

* Custom reusable widgets
* Google Fonts
* Light and Dark themes
* Arabic RTL support
* Animated UI components
* Custom loading and error states

## 🚀 Getting Started

### Prerequisites

Make sure you have:

* Flutter SDK
* Dart SDK
* Android Studio or VS Code
* Android Emulator or Physical Device
* Firebase project configured
* Firebase Authentication enabled
* Cloud Firestore configured
* Google Sign-In configured

Navigate to the project:

```bash
cd eventlyapp
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

## 👨‍💻 Developer

**Eng. Omar Ahmed Ali**

**Flutter / Mobile Application Developer**

Built with **Flutter & Dart**, integrated with **Firebase**, and developed using **Clean Architecture, SOLID Principles, Provider, and reusable components**.

#Flutter #Dart #Evently #Firebase #Firestore #FirebaseAuth #GoogleSignIn #FlutterDeveloper #MobileDevelopment #CleanArchitecture #SOLID #Provider #SharedPreferences #FlutterProjects
