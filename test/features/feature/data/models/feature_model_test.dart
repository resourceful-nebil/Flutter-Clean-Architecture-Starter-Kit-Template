
import 'package:flutter_test/flutter_test.dart';
import 'package:your_project_name/features/feature_name/data/models/feature_model.dart';

void main() {
  final tFeatureModel = FeatureModel(id: 1, name: 'Test Feature');

  group('FeatureModel', () {
    test('should correctly convert from JSON', () {
      // Arrange
      final json = {'id': 1, 'name': 'Test Feature'};

      // Act
      final result = FeatureModel.fromJson(json);

      // Assert
      expect(result, tFeatureModel);
    });

    test('should correctly convert to JSON', () {
      // Arrange
      final expectedJson = {'id': 1, 'name': 'Test Feature'};

      // Act
      final result = tFeatureModel.toJson();

      // Assert
      expect(result, expectedJson);
    });
  });
}
