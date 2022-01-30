# Inventory Management System - Quick & Easy Order

<p>&nbsp;</p>

> _This project has been deprecated and not longer maintained._

<p>&nbsp;</p>

The aim of Quick & Easy Order is to design, optimise and streamline Back-of-House street market or restaurant operations, saving time and money to the companies, improving the daily processes.

- Project Description and Objectives
  - Simplify Back of House Operations, organizing and track your inventory easily, maintaining optimal inventory levels, with alerts and reports
  - Remote access to the system for multiple users
  - Online purchasing - reducing employee cost
  - Central kitchen operations through the app

## Requirements

- Xcode - v13.1 or higher
- Android Studio - 2021.1.1 (Bumblebee) or higher
- [Flutter v2.8.1](https://docs.flutter.dev/development/tools/sdk/releases)
- [Firebase CLI - v10.1.2](https://firebase.google.com/docs/cli)

## Tests

- Android - API 32 - arm64 architecture
- iPhone 13 - iOS 15

### Google Cloud Platform

- Database: Cloud Firestore
- Authentication: Firebase Authentication

## Installation

### Flutter

Follow the steps on the [flutter official documentation](https://docs.flutter.dev/get-started/install).

### Install dependencies

```bash
flutter pub get
```

### Run

```bash
flutter run
```

### Features Implemented

- User creation
- Login
- Unique stock list for each user
- Stock changes using real time database

### Missing features

- Add need items to a stock list
- Create categories
- User profile
- Create stock reports
- User privileges - Admin
