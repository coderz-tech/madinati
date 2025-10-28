import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madinati/core/constants/pngs.dart';
import 'package:madinati/core/constants/svgs.dart';
import 'package:madinati/core/locale/presentation/bottom_sheet/lang_bottom_sheet.dart';
import 'package:madinati/core/presentation/widgets/custom_button.dart';
import 'package:madinati/core/utils/responsive.dart';
import 'package:madinati/features/home/presentation/screens/home_screen.dart';
import 'package:madinati/features/trips/presentation/driver/current_trip/view/driver_current_trip.dart';
import 'package:madinati/features/trips/presentation/driver/upcoming_trip/view/upcoming_trip_screen.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../home/domain/entity/bottom_nav_bar_entity.dart';
import '../../../home/presentation/config/nav_config.dart';
import '../../../home/presentation/cubits/nav_bar_cubit.dart';
import '../../../operation_plans/presentation/driver/operation_plans/view/operation_plans_screen.dart';
import '../../../tabs/presentation/cubits/tabs_cubit.dart';
import '../../../trips/presentation/operation_manager/current_trip/view/opm_current_trip_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// todo text
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: false,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (context) {
                  return LangBottomSheet(
                    screenWidth: responsiveWidth(context, 430),
                    screenHeight: responsiveHeight(context, 486),
                  );
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.lang_name,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineLarge?.copyWith(fontSize: 18.sp),
                      ),
                    ],
                  ),
                  SizedBox(width: responsiveWidth(context, 4)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Svgs.global,
                        height: responsiveHeight(context, 24),
                        width: responsiveWidth(context, 24),
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            children: [
              SizedBox(height: responsiveHeight(context, 132)),
              Image.asset(
                Pngs.logo,
                height: responsiveHeight(context, 75),
                width: responsiveWidth(context, 75),
                fit: BoxFit.fill,
              ),
              SizedBox(height: responsiveHeight(context, 29)),
              Text(
                AppLocalizations.of(context)!.login,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: responsiveHeight(context, 29)),
              Text(
                "مرحبًا بك مرة أخرى، أدخل بياناتك حتى تبدأ بالعمل معنا.",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
              SizedBox(height: responsiveHeight(context, 81)),
              CustomButton(
                label: "الدخول مع رقم الهوية/الإقامة",
                onTap: () {
                  if(false){
                    // List<Widget> screens = [
                    //   const DriverCurrentTrip(),
                    //   const UpcomingTripScreen(),
                    //   const OperationPlansScreen(),
                    // ];
                    // List<String> titles = [
                    //   AppLocalizations.of(context)!.current_trip,
                    //   AppLocalizations.of(context)!.next_trip,
                    //   AppLocalizations.of(context)!.operational_plans,
                    // ];
                    // context.read<TabsCubit>().initial(
                    //   screens: screens,
                    //   titles: titles,
                    // );
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => HomeScreen()),
                    // );
                    final navCubit = NavBarCubit()..load(Actor.driver);
                    print(navCubit.tabs);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: navCubit,
                          child: const HomeScreen(),
                        ),
                      ),
                    );
                  }else if(true){
                    final navCubit = NavBarCubit()..load(Actor.monitorManager);
                    print(navCubit.tabs);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: navCubit,
                          child: const HomeScreen(),
                        ),
                      ),
                    );
                  }

                },
              ),
              SizedBox(height: responsiveHeight(context, 40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Divider(thickness: 1, color: AppColors.greyText),
                  Text(
                    AppLocalizations.of(context)!.or,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Divider(thickness: 1),
                ],
              ),
              SizedBox(height: responsiveHeight(context, 40)),
              SvgPicture.asset(
                Svgs.faceId,
                height: responsiveHeight(context, 64),
                width: responsiveWidth(context, 64),
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
