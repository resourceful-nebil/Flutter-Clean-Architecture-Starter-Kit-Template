# 🚀 Flutter Clean Architecture VS Code Extension 🚀

<p align="center">
  <a href="https://flutter.dev/"><img src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=flutter&logoColor=white"></a>
  <a href="https://dart.dev/"><img src="https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white"></a>
  <a href="https://nodejs.org/"><img src="https://img.shields.io/badge/Node.js-%23339933.svg?style=for-the-badge&logo=node.js&logoColor=white"></a>
  <a href="https://marketplace.visualstudio.com/"><img src="https://img.shields.io/badge/VS%20Code-%23007ACC.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white"></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge&logo=open-source-initiative&logoColor=white"></a>
  <img src="https://img.shields.io/badge/Version-0.0.3-%234285F4.svg?style=for-the-badge&logo=git&logoColor=white">
</p>

Quickly scaffold and maintain **Flutter Clean Architecture** features right from Visual Studio Code! This extension automates the creation of boilerplate code for new features, including the necessary folder structure for a clean, testable, and maintainable Flutter application.

> **Note**: This project is heavily inspired by the open-source repository [Flutter-Clean-Architecture-Starter-Kit-Template](https://github.com/resourceful-nebil/Flutter-Clean-Architecture-Starter-Kit-Template).
> All credits for the original architecture and structure go to them! ✨

---

## 📖 Table of Contents

1. [Features](#features)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Folder Structure](#folder-structure)
6. [Watch the Extension in Action](#watch-the-extension-in-action)
7. [Contributing](#contributing)
8. [License](#license)
9. [Credits &amp; References](#credits--references)

---

## ✨ Features

- **Clean Architecture Scaffolding**: Automatically generates `core`, `data`, `domain`, and `presentation` folders (and subfolders) following the Clean Architecture approach.
- **Boilerplate Code Creation**: Instantly creates essential boilerplate files (e.g., data sources, repositories, use cases, BLoC, pages, etc.) with a single command.
- **Detect & Create Core Folder**: If your project doesn't already have a `core` folder, the extension creates it for you.
- **Customizable Feature Names**: You simply provide a feature name, and the extension handles the rest!
- **Remove Existing Feature**: Quickly remove an existing feature folder once you no longer need it.

---

## 🔧 Prerequisites

- **Flutter SDK** (v3.0 or higher recommended)
- **Dart** (bundled with Flutter)
- **VS Code** (latest version recommended)

---

## ⚙️ Installation

1. **Open your Flutter project** in VS Code.
2. **Search Extensions**: Open VS Code’s Extensions tab (`Ctrl + Shift + X` / `Cmd + Shift + X`) and search for **“Flutter Clean Architecture Starter Kit”**.
3. **Install & Reload**: Click install on the extension, then reload VS Code if prompted.

---

## 🚀 Usage

### Create or Open an Existing Flutter Project in VS Code.

 **Creating a New Feature**

1. Open the **Command Palette** (`Ctrl + Shift + P` / `Cmd + Shift + P`).
2. Search for **Create new feature** (the name of the command in this extension).
3. Enter the **feature name** when prompted.
4. 🎉 **Voila!** Your new feature folder (and `core` folder, if missing) will be generated with all the necessary boilerplate files!
   - `data`
   - `domain`
   - `presentation`
   - plus any essential subfolders like `datasources`, `models`, `entities`, `usecases`, `screens`, `repositories`, etc.

**Removing an Existing Feature**

Open the **Command Palette** (`Ctrl + Shift + P` / `Cmd + Shift + P`).

1. Search for **Remove existing feature** (the command to delete a feature).
2. **Enter** the feature name you want to remove.
3. **Confirm** when prompted.
4. The selected feature folder (e.g., `lib/features/<featureName>`) will be **permanently deleted**.

### Example

If you run the command **“Create New Feature”** and type in `profile`, you’ll get something like this:

```
lib/
├── core/
│   ├── connections/
│   ├── databases/
│   ├── errors/
│   └── params/
├── features/
│   └── profile/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       └── presentation/
│           ├── Widgets/
│           └── screens/
```

---

## 🗂️ Folder Structure

The extension follows the same folder structure as the [Flutter-Clean-Architecture-Starter-Kit-Template](https://github.com/resourceful-nebil/Flutter-Clean-Architecture-Starter-Kit-Template).

```
lib/
├── core/
│   ├── connections/
│   ├── databases/
│   ├── errors/
│   └── params/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── Widgets/
│   └── screens/
└── main.dart
```

---

## 🤝 Contributing

1. **Fork** the repo at [Flutter-Clean-Architecture-Starter-Kit-Vs-Extension](https://github.com/maajidAwol/Flutter-Clean-Architecture-Starter-Kit-Vs-Extension.git).
2. **Create** a new branch for your feature or fix.
3. **Commit** your changes with a descriptive commit message.
4. **Push** to your branch.
5. **Submit** a Pull Request (PR).

We appreciate any contributions that improve this extension—be it bug fixes, documentation, or new features!

---

## ⚖️ License

This project is licensed under the **[MIT License](LICENSE)**.
It also references and utilizes code structures from the [Flutter-Clean-Architecture-Starter-Kit-Template](https://github.com/resourceful-nebil/Flutter-Clean-Architecture-Starter-Kit-Template), which is under the MIT License as well.

---

## 💡 Credits & References

- **Credit**: [Flutter-Clean-Architecture-Starter-Kit-Template](https://github.com/resourceful-nebil/Flutter-Clean-Architecture-Starter-Kit-Template).
- **Flutter**: [flutter.dev](https://flutter.dev/)
- **Dart**: [dart.dev](https://dart.dev/)
- **VS Code**: [code.visualstudio.com](https://code.visualstudio.com/)

If you find this extension useful, please consider ⭐ starring the original repo and this one!
**Happy coding!** 🥳
