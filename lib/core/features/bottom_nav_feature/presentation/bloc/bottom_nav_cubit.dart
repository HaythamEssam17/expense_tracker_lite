import 'package:expense_tracker_lite/features/dashboard/presentation/pages/dashboard_home_page.dart';
import 'package:expense_tracker_lite/features/profile/presentation/pages/profile_home_page.dart';
import 'package:expense_tracker_lite/features/wallet/presentation/pages/wallet_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../features/insights/presentation/pages/insights_home_page.dart';

@Injectable()
class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  final List<Widget> pages = [
    const DashboardHomePage(),
    const InsightsHomePage(),
    Container(),
    const WalletHomePage(),
    const ProfileHomePage(),
  ];

  final PageController pageController = PageController();
  void changePage(int index) {
    emit(index);
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    emit(index);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
