import 'package:get/get.dart';
import 'package:talos_test/services/notification/notification_service_impl.dart';

import '../../../services/screen_one/screen_one_service.dart';
import '../../../shared_contents/models/failure.dart';
import '../../../shared_contents/utilities/state_notifier.dart';
import '../models/screen_one_model.dart';

class ScreenOneController extends StateNotifier {
  final _screenOneService = Get.find<ScreenOneService>();

  String? _coin;
  List<PricesModel>? _prices;
  List<PricesModel>? _filteredPrices;

  String? get coin => _coin;
  List<PricesModel>? get filteredPrices => _filteredPrices;

  @override
  void onInit() async {
    super.onInit();
    await _getPrices();
    NotificationService notificationService = NotificationService();
    await notificationService.init();
    await notificationService.requestIOSPermissions();
  }

  void onCoinChanged(String? value) async {
    _coin = value;
    _filterCoin();
    update();
  }

  Future<void> _getPrices() async {
    try {
      setState(LoadingState());
      _prices = await _screenOneService.getPrices();
      _filteredPrices = await _screenOneService.getPrices();
      setState(IdleState());
    } on Failure catch (ex) {
      setState(ErrorState(message: ex.message));
    }
  }

  void _filterCoin() {
    setState(LoadingState());
    Future.delayed(const Duration(seconds: 1), () {
      if (coin == 'All') {
        _filteredPrices = _prices;
        setState(IdleState());
      } else {
        final _filter = _prices?.where(
          (x) {
            final symbol = x.symbol?.toLowerCase();
            return symbol!.contains(_coin!.toLowerCase());
          },
        ).toList();
        _filteredPrices = _filter;
        setState(IdleState());
      }
    });
  }
}
