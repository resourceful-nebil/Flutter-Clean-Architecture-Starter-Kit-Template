# 📱Flutter Clean Architecture Starter Kit🌍

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Version](https://img.shields.io/badge/Version-1.0.0-blue)

Welcome to the **Flutter Clean Architecture Starter Kit**! This repository is designed to provide a solid foundation for your Flutter projects by implementing clean architecture principles, best practices, and modern development tools.

---

## Clean Architecture Overview

Clean Architecture is a software design philosophy that emphasizes the separation of concerns, creating highly maintainable, testable, and scalable applications.

![image](https://github.com/user-attachments/assets/c648fcc8-5277-4d9e-b27f-9fef4c25b10d)

Benefits of Clean Architecture:

- 💡 **Scalability**: Easily adapt your codebase to new features and requirements.
- 🧪 **Testability**: Simplify unit testing by isolating business logic from the UI and data sources.
- 🛠️ Maintainability: Modular design improves readability and reduces technical debt.
- 🔄 Reusability: Code can be reused across platforms and layers.

This starter kit follows the Clean Architecture pattern, ensuring your Flutter projects adhere to these principles from the start.

---

## Features

- 🏗️ **Layered Architecture:** Clear separation of `Presentation`, `Domain`, and `Data` layers.
- 🎯 **State Management:** Powered by `flutter_bloc` for robust and reactive state handling.
- 🛠️ **Dependency Injection:** Easy service locator setup using `GetIt`.
- 🌐 **Networking:** API integration made simple with `dio`.
- 💾 **Local Storage:** Manage lightweight data storage using `shared_preferences`.
- ⚡ **Error Handling:** Functional programming tools via `dartz` for safe and predictable error handling.
- 📶 **Connectivity:** Network checks using `data_connection_checker_tv`.

---

## Folder Structure

This starter kit follows the Clean Architecture structure:

```
lib/
├── core/              # Core utilities and constants
│   ├── error/         # Error handling utilities
│   ├── network/       # Network-related utilities
│   ├── usecases/      # Base classes for use cases
│   ├── utils/         # General utility functions
│   └── injection_container.dart # Dependency injection setup
├── data/              # Data layer (API, models, and repositories)
│   ├── datasources/   # Remote and local data sources
│   ├── models/        # Data models (e.g., JSON responses)
│   └── repositories/  # Implementation of domain repositories
├── domain/            # Domain layer (business logic)
│   ├── entities/      # Business entities
│   ├── repositories/  # Abstract repository contracts
│   └── usecases/      # Application-specific business rules
├── presentation/      # Presentation layer (UI)
│   ├── blocs/         # BLoC and Cubit for state management
│   ├── pages/         # Screens and pages
│   └── widgets/       # Reusable widgets
└── main.dart          # Application entry point
```

---

## Core Folder Structure

The `core` folder contains shared utilities and base classes that provide foundational functionality across your application:

### `error/`:
- Manages error and failure handling across all layers.
- Provides classes like `Failure` to standardize error representation.

### `network/`:
- Handles network-related concerns such as connectivity checks.
- Ensures reliable API interaction by checking connection status.

### `usecases/`:
- Contains base use case classes to define consistent business logic patterns.
- Simplifies interaction between domain and data layers.

### `utils/`:
- Houses helper functions, constants, and other reusable utilities.
- Provides tools to reduce code duplication and enhance maintainability.

### `injection_container.dart`:
- Configures and manages dependency injection using GetIt.
- Centralizes dependency registration for easy maintenance.

## Features Folder Structure

The `features` folder organizes your app's functionalities into independent modules. Each module contains its own `data`, `domain`, and `presentation` layers, ensuring modularity and scalability.

### `template/`:
- A ready-to-use template to quickly scaffold new features.
- Copy and rename the folder to match your feature name.

#### Subfolders in `template/`:

##### `data/`:
- Implements data sources, models, and repository logic.
- Connects to remote APIs or local databases.

##### `domain/`:
- Defines core business entities and use cases.
- Encapsulates application-specific business rules.

##### `presentation/`:
- Contains UI components like pages, widgets, and BLoC for state management.
- Ensures seamless integration with the user interface.


---

## Getting Started

### Prerequisites

- **Flutter SDK**: Ensure you have Flutter installed. Follow the [official guide](https://docs.flutter.dev/get-started/install) if needed.
- **IDE**: Use any Flutter-supported IDE (VS Code, Android Studio, etc.).
- **Dart**: Version 3.0 or higher is recommended.

### Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/resourceful-nebil/Flutter-Clean-Architecture-Starter-Kit-Template.git
   cd Flutter-Clean-Architecture-Starter-Kit-Template
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the App**
   ```bash
   flutter run
   ```

---

## How to Use

### Adding Features

1. **Use the Template Folder**
   - Open **VS Code** and use the **Search and Replace** feature.
   - Search for the word `template` and replace it with the name of the feature you are implementing.
   - Copy the `template` feature folder as many times as you need for additional features.
   - Replace `template` in all copied folders with the respective feature name.

   This process will save you time by automating the creation of boilerplate code for your app's features, keeping your project consistent and clean.

2. **Define Entities** in `domain/entities/` to represent core business objects.
3. **Create Use Cases** in `domain/usecases/` to encapsulate application-specific business logic.
4. **Implement Repositories** in `data/repositories/` to handle data fetching and storage logic.
5. **Add Data Sources** in `data/datasources/` for remote (API) and local (cache) data handling.
6. **Integrate with UI** using `flutter_bloc` for state management and UI updates.

### Dependency Injection

Dependencies are managed with `GetIt`. Add your dependencies in `lib/core/injection_container.dart`:

```dart
final sl = GetIt.instance;

void init() {
  // Example: Register a repository
  sl.registerLazySingleton<YourRepository>(() => YourRepositoryImpl(sl()));
}
```

---

## Tools and Libraries

- **[flutter_bloc](https://pub.dev/packages/flutter_bloc):** State management.
- **[dio](https://pub.dev/packages/dio):** Networking.
- **[shared_preferences](https://pub.dev/packages/shared_preferences):** Local storage.
- **[dartz](https://pub.dev/packages/dartz):** Functional programming.
- **[data_connection_checker_tv](https://pub.dev/packages/data_connection_checker_tv):** Internet connectivity.

---

## Example

Here’s a quick walkthrough for adding a feature:

### Feature: Fetch User Profile

1. **Entity**
   ```dart
   class UserProfile {
     final String id;
     final String name;
     final String email;

     UserProfile({required this.id, required this.name, required this.email});
   }
   ```

2. **Use Case**
   ```dart
   class GetUserProfile {
     final UserRepository repository;

     GetUserProfile(this.repository);

     Future<Either<Failure, UserProfile>> call(String userId) {
       return repository.getUserProfile(userId);
     }
   }
   ```

3. **Repository Contract**
   ```dart
   abstract class UserRepository {
     Future<Either<Failure, UserProfile>> getUserProfile(String userId);
   }
   ```

4. **Repository Implementation**
   ```dart
   class UserRepositoryImpl implements UserRepository {
     final RemoteDataSource remoteDataSource;

     UserRepositoryImpl(this.remoteDataSource);

     @override
     Future<Either<Failure, UserProfile>> getUserProfile(String userId) async {
       try {
         final result = await remoteDataSource.fetchUserProfile(userId);
         return Right(result);
       } catch (e) {
         return Left(ServerFailure());
       }
     }
   }
   ```

5. **Remote Data Source**
   ```dart
   class RemoteDataSource {
     final Dio dio;

     RemoteDataSource(this.dio);

     Future<UserProfile> fetchUserProfile(String userId) async {
       final response = await dio.get('/users/$userId');
       return UserProfile(
         id: response.data['id'],
         name: response.data['name'],
         email: response.data['email'],
       );
     }
   }
   ```

---


# Contributing to Flutter Clean Architecture Starter Kit 🚀

Thank you for considering contributing to this project! 🙌 Here are the guidelines to get you started:

## How to Contribute 🌟

1. **Fork the Repository** 🍴: Create a fork of this repository to your own GitHub account.

2. **Clone Your Fork** 🖥️:
   ```bash
   git clone https://github.com/your-username/Flutter-Clean-Architecture-Starter-Kit-Template.git
   ```

3. **Create a Branch** 🌿:
   Create a feature branch for your changes.
   ```bash
   git checkout -b feature/my-feature
   ```

4. **Make Your Changes** 🛠️:
   - Ensure your code adheres to the coding style and project structure.
   - Add tests for your changes if applicable.

5. **Commit Your Changes** ✅:
   Write clear and descriptive commit messages.
   ```bash
   git commit -m "✨ Add feature: my feature description"
   ```

6. **Push Your Changes** 🚀:
   ```bash
   git push origin feature/my-feature
   ```

7. **Submit a Pull Request** 🔄:
   - Open a pull request on the main repository.
   - Provide a detailed description of your changes.

---

## Testing Needs Your Contribution 🧪

The `test` folder is a critical part of this project, and it’s not yet complete. We rely on community contributions to improve test coverage and ensure code quality.

### How You Can Help:
- Write unit tests for untested functions and features.
- Improve existing tests to make them more robust.
- Report any gaps in the testing framework.

### Why Contribute to Testing? 🌟
- Ensure the project's reliability for all users.
- Learn and practice **test-driven development (TDD)**.
- Gain valuable experience contributing to an open-source project.

If you're new to testing, no worries! Check out [Testing Guidelines](#testing-guidelines) below for tips and resources to get started.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Code of Conduct 📝

By contributing, you agree to follow our [Code of Conduct](CODE_OF_CONDUCT.md).

---

## Reporting Issues 🐛

If you find a bug or have a feature request, please [open an issue](https://github.com/resourceful-nebil/Flutter-Clean-Architecture-Starter-Kit-Template/issues) on GitHub.

---

## Feedback and Suggestions 💡

We welcome feedback and suggestions to improve the project. Feel free to reach out via the Issues tab or submit a pull request with your proposal.

Thank you for contributing! 🎉


