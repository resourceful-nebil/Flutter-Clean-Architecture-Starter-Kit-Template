
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_project_name/features/feature_name/domain/repositories/feature_repository.dart';
import 'package:your_project_name/features/feature_name/domain/usecases/get_feature_usecase.dart';

class MockFeatureRepository extends Mock implements FeatureRepository {}

void main() {
  late GetFeatureUseCase useCase;
  late MockFeatureRepository mockRepository;

  setUp(() {
    mockRepository = MockFeatureRepository();
    useCase = GetFeatureUseCase(repository: mockRepository);
  });

  group('GetFeatureUseCase', () {
    final tFeature = Feature(id: 1, name: 'Test Feature');

    test('should return Feature from the repository', () async {
      // Arrange
      when(() => mockRepository.getFeature()).thenAnswer((_) async => tFeature);

      // Act
      final result = await useCase();

      // Assert
      expect(result, tFeature);
      verify(() => mockRepository.getFeature()).called(1);
    });
  });
}
