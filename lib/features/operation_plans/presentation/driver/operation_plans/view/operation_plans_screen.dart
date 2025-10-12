import 'package:flutter/material.dart';
import 'package:madinati/core/utils/responsive.dart';
import 'package:madinati/features/operation_plans/presentation/driver/operation_plans/view/widget/operation_plan_card.dart';

import '../../operation_plan_details/view/operation_plans_details_screen.dart';

class OperationPlansScreen extends StatelessWidget {
  const OperationPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: responsiveHeight(context, 12)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OperationPlansDetailsScreen(),
                  ),
                );
              },
              child: OperationPlanCard(),
            ),
          );
        },
      ),
    );
  }
}
