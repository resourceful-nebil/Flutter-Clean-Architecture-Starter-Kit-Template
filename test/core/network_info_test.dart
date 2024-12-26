   import 'package:data_connection_checker_tv/data_connection_checker.dart';
   import 'package:flutter_test/flutter_test.dart';
   import 'package:mocktail/mocktail.dart';
   import 'path_to_your_network_info_file/network_info.dart';

   class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

   void main() {
     late NetworkInfoImpl networkInfo;
     late MockDataConnectionChecker mockDataConnectionChecker;

     setUp(() {
       mockDataConnectionChecker = MockDataConnectionChecker();
       networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
     });

     group('isConnected', () {
       test('should forward the call to DataConnectionChecker.hasConnection', () async {
         // Arrange
         final tHasConnectionFuture = Future.value(true);

         when(() => mockDataConnectionChecker.hasConnection)
             .thenAnswer((_) => tHasConnectionFuture);

         // Act
         final result = networkInfo.isConnected;

         // Assert
         verify(() => mockDataConnectionChecker.hasConnection).called(1);
         expect(result, tHasConnectionFuture);
       });
     });
   }
