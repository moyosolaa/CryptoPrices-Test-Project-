import '../../features/screen_one/models/screen_one_model.dart';
import '../network/network_service_impl.dart';
import 'screen_one_service.dart';

class ScreenOneServiceImpl extends NetworkServiceImpl implements ScreenOneService {
  @override
  Future<List<PricesModel>?> getPrices() async {
    final uri = getAPI.getPrices;
    final response = await get(
      uri,
    );
    return PricesModelResponse.fromJson(response).prices;
  }
}
