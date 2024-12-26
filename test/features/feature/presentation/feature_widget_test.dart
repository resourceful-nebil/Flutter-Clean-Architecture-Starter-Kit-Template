
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_project_name/features/feature_name/presentation/widgets/feature_widget.dart';

void main() {
  testWidgets('should display the correct feature information', (WidgetTester tester) async {
    // Arrange
    final tFeature = Feature(id: 1, name: 'Test Feature');

    // Act
    await tester.pumpWidget(MaterialApp(home: FeatureWidget(feature: tFeature)));

    // Assert
    expect(find.text('Test Feature'), findsOneWidget);
  });
}
