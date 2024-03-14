import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/history_rating_bottom_sheet/business_logic/rating_sheet_provider.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/history_rating_bottom_sheet/domain/usecase/rating_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRatingUseCase extends Mock implements RatingUseCase {}

void main() async {
  late MockRatingUseCase? mockRatingUseCase;
  late RatingSheetProvider? ratingSheetProvider;
  setUp(() {
    mockRatingUseCase = MockRatingUseCase();
    ratingSheetProvider = RatingSheetProvider(mockRatingUseCase!);
  });

  group('test rate a service functionality in provider', () {
    test(
      "initial values of provider should be correct",
      () async {
        // Assert
        expect(ratingSheetProvider!.isLoading, false);
        expect(ratingSheetProvider!.isError, false);
      },
    );
  });
}
