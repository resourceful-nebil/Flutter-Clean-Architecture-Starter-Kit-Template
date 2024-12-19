# Flutter Clean Architecture Starter Kit

Welcome to the **Flutter Clean Architecture Starter Kit**! This repository is designed to provide a solid foundation for your Flutter projects by implementing clean architecture principles, best practices, and modern development tools.

---

## Features

- **Layered Architecture:** Clear separation of `Presentation`, `Domain`, and `Data` layers.
- **State Management:** Powered by `flutter_bloc` for robust and reactive state handling.
- **Dependency Injection:** Easy service locator setup using `GetIt`.
- **Networking:** API integration made simple with `dio`.
- **Local Storage:** Manage lightweight data storage using `shared_preferences`.
- **Error Handling:** Functional programming tools via `dartz` for safe and predictable error handling.
- **Connectivity:** Network checks using `data_connection_checker_tv`.

---

## Folder Structure

This starter kit follows the Clean Architecture structure:

```
lib/
├── core/              # Core utilities and constants
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

1. **Define Entities** in `domain/entities/` to represent core business objects.
2. **Create Use Cases** in `domain/usecases/` to encapsulate application-specific business logic.
3. **Implement Repositories** in `data/repositories/` to handle data fetching and storage logic.
4. **Add Data Sources** in `data/datasources/` for remote (API) and local (cache) data handling.
5. **Integrate with UI** using `flutter_bloc` for state management and UI updates.

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

## Contribution

Contributions are welcome! Feel free to open issues or submit pull requests to improve this starter kit.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


