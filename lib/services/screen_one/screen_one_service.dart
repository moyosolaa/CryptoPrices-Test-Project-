import '../../features/screen_one/models/screen_one_model.dart';

abstract class ScreenOneService {
  Future<List<PricesModel>?> getPrices();
}
