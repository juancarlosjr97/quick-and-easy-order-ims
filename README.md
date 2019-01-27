# Inventory Management System - Quick & Easy Order

The aim of Quick & Easy Order is to design, optimise and streamline Back-of-House street market or restaurant operations, saving time and money to the companies, improving the daily processes.

* Project Description and Objectives
  * Simplify Back of House Operations, organising and track your inventory easily, maintaining optimal inventory levels, with alerts and reports
  * Remote access to the system for multiple users
  * Online purchasing - reducing employee cost
  * Central kitchen operations through the app

## Documentation and testing

### Requirements
* Flutter 1.0.0
* cupertino_icons: 0.1.2
* cloud_firestore: 0.8.2
* font_awesome_flutter: 8.1.0
* firebase_auth: 0.6.2+1

### Tested

* iOS 12
* Android 7
* Android Studio
* XCode 10.1 (10B61)

### Google Cloud
* Database - Cloud Firestore
* Firebase Authentication

## Before running the app

Assume have `flutter` installed and using Android Studio. For help getting started with  [Flutter](https://flutter.io/), view the online documentation

    # Install flutter and dart plugin Android Studio
    Start Android Studio.
    Open plugin preferences (Preferences > Plugins on macOS, File > Settings > Plugins on Windows & Linux).
    Select Browse repositories, select the Flutter plugin and click Install.
    Click Yes when prompted to install the Dart plugin.
    Click Restart when prompted.


    # Install dependencies
    run `flutter packages` get on terminal

    # Run iOS Simulator
    run `open -a Simulator.app`
    * Check if a device is running `flutter devices`

## Running the app

  ### Option 1
  [Using Android Studio](https://flutter.io/docs/get-started/test-drive?tab=androidstudio)

  ### Option 2
  [Using Terminal](https://flutter.io/docs/get-started/test-drive?tab=terminal)

### Features
* User creation
* Login
* Unique stock list for each user
* Stock changes using real time database

### Missing features
* Add need items to a stock list
* Create categories
* User profile
* Create stock reports
* User priviligies - Admin
