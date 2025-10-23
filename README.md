# To-Do List App

## Overview

This is a simple To-Do List app built using **Flutter**. The app uses **BLoC** for state management and **Firebase Firestore** for storing task data.

---

## Features

* Display all tasks from Firestore
* Add new task
* Edit existing task
* Delete task
* Mark tasks as completed or pending

---

## Technologies Used

* **Flutter** – for UI development
* **Firebase Firestore** – for backend database
* **BLoC** – for state management

---

## Color Palette

* Primary: `#1E6F9F`
* Surface: `#1A1A1A`
* On Surface: `#FFFFFF`

---

## How to Run

1. Clone this repository.
2. Set up Firebase and add the `google-services.json` file in the Android app folder.
3. Run the following commands:

   ```bash
   flutter pub get
   flutter run
   ```

---

## Folder Structure

```
lib/
 ├── blocs/
 ├── models/
 ├── repositories/
 ├── screens/
 ├── widgets/
 └── main.dart
```

---

## Demo

* **Video Demo:** []
* **APK Download:** build/app/outputs/flutter-apk/app-release.apk

---

## Notes

* The app connects to Firestore for task management.
* BLoC is used for handling state changes.
* Full CRUD (Create, Read, Update, Delete) functionality implemented.

---

**Author:** Mohamed sinaas p
**Repository:** Private GitHub Repository
