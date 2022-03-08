import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/screen_one_controller.dart';
import '../models/screen_one_model.dart';
import '../../../shared_contents/utilities/state_notifier.dart';
import '../../../shared_contents/widgets/list_components.dart';
import '../../../shared_contents/constants/colors/colors.dart';
import '../../../shared_contents/widgets/app_dropdown.dart';
import '../../../shared_contents/widgets/spacing.dart';

class ScreenOneView extends StatelessWidget {
  const ScreenOneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: GetBuilder<ScreenOneController>(
                      builder: (_controller) {
                        return AppDropdown(
                          items: const ['All', 'BTC', 'ETH', 'USDT'],
                          value: _controller.coin,
                          onChanged: _controller.onCoinChanged,
                          hintText: 'Select Coin',
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Coin Pair'),
                          Text('Price'),
                        ],
                      ),
                      const Spacing.height(15),
                      Expanded(
                        child: GetBuilder<ScreenOneController>(
                          builder: (_controller) {
                            if (_controller.state is LoadingState) {
                              return const LoadingList();
                            } else if (_controller.state is ErrorState) {
                              return const Text('Unknown error, contact support.');
                            } else {
                              if (_controller.filteredPrices == null) {
                                return EmptyList(
                                  title: 'Prices',
                                  fallBackAction: () {
                                    // Get.toNamed(Routes.addBeneficiaryView);
                                  },
                                );
                              } else {
                                return ListView.builder(
                                  itemCount: _controller.filteredPrices!.length,
                                  itemBuilder: (context, index) => PriceListItem(
                                    price: _controller.filteredPrices![index],
                                  ),
                                );
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class PriceListItem extends StatelessWidget {
  const PriceListItem({Key? key, required this.price}) : super(key: key);

  final PricesModel price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Scrollbar(
        child: Container(
          color: AppColors.grey.withOpacity(0.10),
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${price.symbol}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Text(
                '${price.price}',
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
