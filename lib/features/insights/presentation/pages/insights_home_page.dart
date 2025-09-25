import 'package:expense_tracker_lite/core/app/app_scaffold_page.dart';
import 'package:expense_tracker_lite/core/widgets/common_title_text.dart';
import 'package:flutter/material.dart';

class InsightsHomePage extends StatelessWidget {
  const InsightsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffoldPage(
      body: Center(child: CommonText('Insights...')),
    );
  }
}
