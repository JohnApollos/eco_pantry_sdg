# 🍏 EcoPantry

![Flutter](https://img.shields.io/badge/Flutter-3.0%2B-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0%2B-blue?logo=dart)
![Status](https://img.shields.io/badge/Status-MVP-green)
![SDG](https://img.shields.io/badge/SDG-12-orange)

**EcoPantry** is a mobile application designed to help households track food inventory, monitor expiration dates, and reduce food waste. Built with **Flutter**, this project serves as a technical demonstration of sustainable technology solutions.

---

## 🌍 The Problem & The Goal (SDG 12)

**Sustainable Development Goal 12: Responsible Consumption and Production**

One-third of all food produced globally is wasted. A significant portion of this happens at the household level simply because consumers lose track of what they have in their fridge.

**EcoPantry targets SDG 12.3:** *"By 2030, halve per capita global food waste at the retail and consumer levels."*

By providing a visual, easy-to-use inventory system, EcoPantry empowers users to:
1.  **Visualize** their food stock.
2.  **Prioritize** ingredients that are expiring soon.
3.  **Reduce** money spent on replacing spoiled food.

---

## 📢 Pitch Deck

View the full project presentation here: [EcoPantry Pitch Deck](https://docs.google.com/presentation/d/1xbYwln_sGae5a0rMAyO4PILjU6VoRUaQomSAXADhqps/edit?usp=sharing)

---

## 📱 Key Features

* **🚦 Traffic Light System:** Visual cues indicate urgency.
    * 🟢 **Green:** Fresh (> 7 days remaining)
    * 🟠 **Orange:** Consume Soon (3 - 7 days remaining)
    * 🔴 **Red:** Critical / Expired (< 3 days remaining)
* **📅 Smart Sorting:** Automatically organizes the pantry list by expiration date (soonest first).
* **💾 Offline First:** Uses local database storage so the app works perfectly without an internet connection.
* **✨ CRUD Operations:** Complete functionality to Add, Read, Update, and Delete inventory items.

---

## 🛠️ Tech Stack

* **Framework:** [Flutter](https://flutter.dev/) (Cross-platform mobile development)
* **Language:** Dart
* **UI Components:** Material Design 3
* **Local Database:** Hive / Shared Preferences (for data persistence)
* **Date Formatting:** `intl` package

---

## 📸 Screenshots

| Dashboard (Mockup) | Add Item Screen (Mockup) |
|:---:|:---:|
| *(Place screenshot here)* | *(Place screenshot here)* |
| *Shows the traffic light list* | *Form to add expiry dates* |

---

## 🚀 Getting Started

To run this project locally, follow these steps:

### Prerequisites
* Flutter SDK installed ([Guide](https://docs.flutter.dev/get-started/install))
* VS Code or Android Studio

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/JohnApollos/eco_pantry_sdg.git
    ```

2.  **Navigate to the project folder:**
    ```bash
    cd eco_pantry_sdg
    ```

3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

4.  **Run the app:**
    ```bash
    flutter run
    ```

---

## 🔮 Future Roadmap

* [ ] **Barcode Scanner:** Integration to scan products for auto-filling details.
* [ ] **Push Notifications:** Reminders at 6:00 PM for items expiring within 24 hours.
* [ ] **Recipe API:** Suggest recipes based on the ingredients currently in the "Orange" zone.

---

## 👤 Author

**John Apollos Olal**
* Software Development Student (Flutter & Dart) at PLP
* [GitHub Profile](https://github.com/JohnApollos)
* [Portfolio](https://apollos-digital.vercel.app)

---

*This project was developed as part of a Software Development Short Course, specializing in Dart & Flutter.*
