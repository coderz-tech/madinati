import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madinati/core/constants/svgs.dart';
import '../../../../core/presentation/widgets/loading_spinkit.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/custom_tab_bar.dart';
import '../cubits/tabs_cubit.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: responsiveWidth(context, 100),
        leading: Padding(
          padding: EdgeInsets.only(left: responsiveWidth(context, 24)),
          child: Row(
            children: [
              SvgPicture.asset(Svgs.global,width: responsiveWidth(context, 24),height: responsiveHeight(context, 24),fit: BoxFit.contain,),
              SizedBox(width: responsiveWidth(context, 16),),
              SvgPicture.asset(Svgs.moon,width: responsiveWidth(context, 24),height: responsiveHeight(context, 24),fit: BoxFit.contain,),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: responsiveWidth(context, 24)),
            child: BlocBuilder<TabsCubit, int>(
              builder: (context, _) {
                return Text(
                  AppLocalizations.of(context)!.operational_plans,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(fontSize: 20.sp),
                );
              },
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            thickness: 1,
            height: 1,
            color: Colors.grey.shade300,
          ),
        ),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: responsiveHeight(context, 18),),
          Center(
            child: Container(
              width: responsiveWidth(context, 390),
              height: responsiveHeight(context, 48),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(
                  context,
                ).colorScheme.secondaryContainer.withValues(alpha: 0.2),
              ),
              child: BlocBuilder<TabsCubit, int>(
                builder: (context, selectedTabIndex) {
                  final cubit = context.read<TabsCubit>();
                  final titles = cubit.titles;
                  if (titles == null) {
                    return const SizedBox.shrink(); // Or CircularProgressIndicator()
                  }
                  return CustomTabBar(
                    tabNames: titles,
                    onTap: (index) {
                      context.read<TabsCubit>().changeTab(index);
                    },
                    selectedIndex: selectedTabIndex,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: responsiveHeight(context, 18),),

          BlocBuilder<TabsCubit, int>(
            builder: (context, selectedTabIndex) {
              final cubit = context.read<TabsCubit>();
              final screens = cubit.screens;
              if (screens == null) {
                return const Expanded(child: Center(child: LoadingSpinKit()));
              }

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(context, 24),
                  ),
                  child: screens[selectedTabIndex],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
