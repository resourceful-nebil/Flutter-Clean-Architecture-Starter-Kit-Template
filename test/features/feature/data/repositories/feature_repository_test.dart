import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_project_name/features/feature_name/data/repositories/feature_repository_impl.dart';
import 'package:your_project_name/features/feature_name/data/data_sources/remote_data_source.dart';
import 'package:your_project_name/features/feature_name/domain/entities/feature.dart';

class MockRemoteDataSource extends Mock implements RemoteDataSource {}

void main() {
  late FeatureRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = FeatureRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('getFeature', () {
    final tFeature = Feature(id: 1, name: 'Test Feature');

    test('should return Feature when the call to remote data source is successful', () async {
      // Arrange
      when(() => mockRemoteDataSource.getFeature()).thenAnswer((_) async => tFeature);

      // Act
      final result = await repository.getFeature();

      // Assert
      expect(result, tFeature);
      verify(() => mockRemoteDataSource.getFeature()).called(1);
    });
  });
}