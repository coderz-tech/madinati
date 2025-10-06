import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/utils/responsive.dart';

class IntroWidget extends StatelessWidget {
  final String slider;
  final String title;
  final String description;
  final String image;
  final bool skip;
  final bool isLastPage;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final VoidCallback onOk;

  const IntroWidget({
    super.key,
    required this.slider,
    required this.title,
    required this.description,
    required this.image,
    required this.skip,
    required this.isLastPage,
    required this.onNext,
    required this.onSkip,
    required this.onOk,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              image,
              fit: BoxFit.fill,
              height: responsiveHeight(context, 555),
              width: responsiveWidth(context, 430),
            ),

            Positioned(
              bottom: 16,
              right: 16,
              child: SvgPicture.asset(
                slider,
                fit: BoxFit.cover,
                height: responsiveHeight(context, 20), // optional sizing
              ),
            ),
          ],
        ),

        Expanded(
          child: Container(
            width: responsiveWidth(context, 430),
            height: responsiveHeight(context, 388),
            // Adjust based on screen size
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: responsiveHeight(context, 14)),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  CustomButton(
                    label: isLastPage ? "ok" : "next",
                    onTap: isLastPage ? onOk : onNext,
                  ),
                  SizedBox(height: responsiveHeight(context, 45)),
                  TextButton(onPressed: () {}, child: Text("skip",style: Theme.of(context).textTheme.bodyMedium,)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
