import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/pngs.dart';
import '../../../../core/constants/svgs.dart';
import '../../../../core/constants/validation.dart';
import '../../../../core/locale/presentation/cubit/locale_cubit.dart';
import '../../../../core/presentation/bottom_sheet/msg_bottom_sheet.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/custom_textfield.dart';
import '../../../../core/locale/presentation/widgets/language_selection_button.dart';
import '../../../../core/presentation/widgets/loading_spinkit.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/utils/secure_storage_helper.dart';
import '../../../theme/presentation/cubits/theme_cubit.dart';
import '../cubits/login_cubit.dart';
import '../cubits/refresh_token_cubit.dart';
import '../states /login_state.dart';
import '../states /refresh_token_state.dart';
import 'fingerprint_custom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _topAnimationController;
  late Animation<Offset> _topSlideAnimation;
  late AnimationController _bottomAnimationController;
  late Animation<Offset> _bottomSlideAnimation;
  late AnimationController _fadeAnimationController;
  late Animation<double> _fadeAnimation;
  late AnimationController _logoAnimationController;
  late Animation<Offset> _logoSlideAnimation;
  late AnimationController _rowToBottomController;
  late Animation<Offset> _rowToBottomAnimation;
  late AnimationController _appBarFadeController;
  late Animation<double> _appBarFadeAnimation;
  late AnimationController _formFadeController;
  late Animation<double> _formFadeAnimation;
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _showText = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticating = false;

  void initializeAnimations() {
    // Top slide animation (initial to top)
    _topAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _topSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _topAnimationController, curve: Curves.easeInOut),
    );

    // Bottom slide animation
    _bottomAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _bottomSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _bottomAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Fade animation for bottom decoration
    _fadeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _fadeAnimationController, curve: Curves.easeIn),
    );

    // Logo slide and scale animation
    _logoAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _logoSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.195), // Start from center
      end: const Offset(0, -0.73), // Move to top
    ).animate(
      CurvedAnimation(
        parent: _logoAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Row to bottom animation
    _rowToBottomController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _rowToBottomAnimation = Tween<Offset>(
      begin: const Offset(0, -0.55), // Start from top position
      end: const Offset(0, 0.38), // Move to bottom
    ).animate(
      CurvedAnimation(parent: _rowToBottomController, curve: Curves.easeInOut),
    );

    // AppBar fade-in animation
    _appBarFadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _appBarFadeAnimation = Tween<double>(
      begin: 0.0, // Start invisible
      end: 1.0, // Fully visible
    ).animate(
      CurvedAnimation(parent: _appBarFadeController, curve: Curves.easeIn),
    );

    // Start initial animations and fetch data
    Future.wait([
      _topAnimationController.forward(),
      _bottomAnimationController.forward(),
    ]).then((_) {
      // Start fade-out for bottom decoration after a delay, then show form
      Future.delayed(const Duration(milliseconds: 500), () {
        _fadeAnimationController.forward().then((_) {
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _showText = true; // Trigger form display after animations
            });
          });
          // Start logo slide/scale and row to bottom animations simultaneously
          Future.wait([
            _logoAnimationController.forward(),
            _rowToBottomController.forward(),
          ]).then((_) {
            // Start AppBar fade-in after logo and row animations
            _appBarFadeController.forward();
          });
        });
      });
    });
    // Form fade-in animation
    _formFadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _formFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _formFadeController, curve: Curves.easeIn),
    );

    // Start initial animations
    Future.wait([
      _topAnimationController.forward(),
      _bottomAnimationController.forward(),
    ]).then((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        _fadeAnimationController.forward().then((_) {
          // After bottom decoration fade-out, play logo/row animations
          Future.wait([
            _logoAnimationController.forward(),
            _rowToBottomController.forward(),
          ]).then((_) {
            // AppBar fade-in
            _appBarFadeController.forward();

            // Now show and fade in the form
            setState(() {
              _showText = true;
            });
            _formFadeController.forward();
          });
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initializeAnimations();
  }

  @override
  void dispose() {
    _topAnimationController.dispose();
    _bottomAnimationController.dispose();
    _fadeAnimationController.dispose();
    _logoAnimationController.dispose();
    _rowToBottomController.dispose();
    _appBarFadeController.dispose();
    nationalIdController.dispose();
    passwordController.dispose();
    _formFadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(responsiveHeight(context, 100)),
        child: FadeTransition(
          opacity: _appBarFadeAnimation,
          child: AppBar(
            toolbarHeight: responsiveHeight(context, 60),
            iconTheme: Theme.of(
              context,
            ).appBarTheme.iconTheme!.copyWith(size: 18.sp),
            title: Text(context.read<LocaleCubit>().getLabelById(id: 1007)),
            centerTitle: true,
            actionsPadding: EdgeInsets.zero,
            actions: [LanguageSelectionButton()],
            automaticallyImplyLeading: false,
          ),
        ),
      ),
      body: Stack(
        children: [
          /// sponsors logos
          if (!_showText)
            SlideTransition(
              position: _topSlideAnimation,
              child: SlideTransition(
                position: _rowToBottomAnimation,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: responsiveHeight(context, 101),
                    bottom: responsiveHeight(
                      context,
                      20,
                    ), // Padding when at bottom
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    // Center alignment for flexibility
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Pngs.capLogo,
                          width: responsiveWidth(context, 83),
                          height: responsiveHeight(context, 37),
                          fit: BoxFit.contain,
                        ),
                        SizedBox(width: responsiveWidth(context, 30)),
                        Image.asset(
                          Pngs.jeddahLogo,
                          width: responsiveWidth(context, 72),
                          height: responsiveHeight(context, 39),
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          /// Main logo
          if (!_showText)
            Align(
              alignment: Alignment.center,
              child: Center(
                child: SlideTransition(
                  position: _logoSlideAnimation,
                  child: Image.asset(
                    Pngs.logo,
                    width: responsiveWidth(context, 300),
                    height: responsiveHeight(context, 300),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

          /// citySkyline decor
          FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _bottomSlideAnimation,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: responsiveHeight(context, 305),
                  width: responsiveWidth(context, 430),
                  child:
                      context.read<ThemeCubit>().isDarkTheme
                          ? SvgPicture.asset(
                            Svgs.bottomDecorDark,
                            fit: BoxFit.cover,
                          )
                          : SvgPicture.asset(
                            Svgs.bottomDecor,
                            fit: BoxFit.cover,
                          ),
                ),
              ),
            ),
          ),

          /// Login form
          if (_showText)
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(context, 16),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Pngs.logo,
                          width: responsiveWidth(context, 300),
                          height: responsiveHeight(context, 300),
                          fit: BoxFit.contain,
                        ),
                        FadeTransition(
                          opacity: _formFadeAnimation,
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: nationalIdController,
                                hintText: context
                                    .read<LocaleCubit>()
                                    .getLabelById(id: 1081),
                                labelText: context
                                    .read<LocaleCubit>()
                                    .getLabelById(id: 1081),
                                prefixIcon: Svgs.email,
                                maxLines: 1,
                                maxLength: 254,
                                inputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context
                                        .read<LocaleCubit>()
                                        .getLabelById(id: 1028);
                                  }
                                  final regex = RegExp(
                                    Validation.onlyNumbersRegex,
                                  );
                                  if (!regex.hasMatch(value)) {
                                    return 'Id is incorrect';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: responsiveHeight(context, 24)),
                              CustomTextField(
                                controller: passwordController,
                                hintText: context
                                    .read<LocaleCubit>()
                                    .getLabelById(id: 1010),
                                labelText: context
                                    .read<LocaleCubit>()
                                    .getLabelById(id: 1010),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return context
                                        .read<LocaleCubit>()
                                        .getLabelById(id: 1028);
                                  }
                                  return null;
                                },
                                prefixIcon: Svgs.lock,
                                isPassword: true,
                                maxLines: 1,
                                maxLength: 65,
                                inputType: TextInputType.text,
                              ),
                              SizedBox(height: responsiveHeight(context, 41)),
                              BlocListener<LoginCubit, LoginState>(
                                listener: (context, state) async {
                                  bool validRole = true;
                                  if (state is LoginLoadedState) {
                                    String roleId = await SecureStorageHelper()
                                        .getPrefString(
                                          key: AppConstants.ROLE_ID,
                                          defaultValue: "0",
                                        );

                                    // context
                                    //     .read<NotificationsCubit>()
                                    //     .fetchNotifications(
                                    //       errorMsg: context
                                    //           .read<LocaleCubit>()
                                    //           .getLabelById(id: 1153),
                                    //     );
                                    //
                                    // if (roleId == AppConstants.driver) {
                                    //   context
                                    //       .read<DriverCurrentTripCubit>()
                                    //       .getDriverCurrentTrip(
                                    //         errorMsg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //       );
                                    //
                                    //   context
                                    //       .read<DriverUpcomingTripCubit>()
                                    //       .getDriverUpcomingTrip(
                                    //         errorMsg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //       );
                                    //
                                    //   context
                                    //       .read<OperationalPlansCubit>()
                                    //       .initialState();
                                    //   context
                                    //       .read<OperationalPlansCubit>()
                                    //       .getOperationalPlans(
                                    //         defaultErrorMsg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //       );
                                    //
                                    //   print("driver");
                                    //   List<Widget> screens = [
                                    //     const DriverCurrentTripsScreen(),
                                    //     const DriverUpcomingTripsScreen(),
                                    //     const DriverOperationalPlansScreen(),
                                    //   ];
                                    //   List<String> titles = [
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1030),
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1031),
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1029),
                                    //   ];
                                    //   context.read<TabsCubit>().initial(
                                    //     screens: screens,
                                    //     titles: titles,
                                    //   );
                                    // }
                                    // else if (roleId == AppConstants.transporter) {
                                    //   List<Widget> screens = [
                                    //     OpmOperationalPlansScreen(),
                                    //     const OpmCurrentTripsScreen(),
                                    //     const OpmUpcomingTripsScreen(),
                                    //     const OpmPendingTripsScreen(),
                                    //     const OpmCompletedTripsScreen(),
                                    //   ];
                                    //   List<String> titles = [
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1095),
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1096),
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1108),
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1124),
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1125),
                                    //   ];
                                    //
                                    //   context
                                    //       .read<CurrentTripsCubit>()
                                    //       .initialState();
                                    //   context
                                    //       .read<CurrentTripsCubit>()
                                    //       .getCurrentTrips(
                                    //         errorMsg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //       );
                                    //
                                    //   context
                                    //       .read<UpcomingTripsCubit>()
                                    //       .initialState();
                                    //   context
                                    //       .read<UpcomingTripsCubit>()
                                    //       .getUpcomingTrips(
                                    //         errorMsg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //       );
                                    //
                                    //   context
                                    //       .read<PendingTripsCubit>()
                                    //       .initialState();
                                    //   context
                                    //       .read<PendingTripsCubit>()
                                    //       .getPendingTrips(
                                    //         errorMsg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //       );
                                    //
                                    //   context
                                    //       .read<CompletedTripsCubit>()
                                    //       .initialState();
                                    //   context
                                    //       .read<CompletedTripsCubit>()
                                    //       .getCompletedTrips(
                                    //         errorMsg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //       );
                                    //
                                    //   context.read<TabsCubit>().initial(
                                    //     screens: screens,
                                    //     titles: titles,
                                    //   );
                                    // }
                                    // else if (roleId == AppConstants.areaManager) {
                                    //   List<Widget> screens = [
                                    //     AreaManagerNewTask(),
                                    //     AreaManagerIncompleteTrip(),
                                    //     AreaManagerCompletedTask(),
                                    //   ];
                                    //   List<String> titles = [
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1193),
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1198),
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1199),
                                    //   ];
                                    //
                                    //   context
                                    //       .read<CurrentTripsCubit>()
                                    //       .initialState();
                                    //   context
                                    //       .read<CurrentTripsCubit>()
                                    //       .getCurrentTrips(
                                    //         errorMsg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //       );
                                    //
                                    //   context
                                    //       .read<PendingTripsCubit>()
                                    //       .initialState();
                                    //   context
                                    //       .read<PendingTripsCubit>()
                                    //       .getPendingTrips(
                                    //         errorMsg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //       );
                                    //
                                    //   context
                                    //       .read<CompletedTripsCubit>()
                                    //       .initialState();
                                    //   context
                                    //       .read<CompletedTripsCubit>()
                                    //       .getCompletedTrips(
                                    //         errorMsg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //       );
                                    //
                                    //   context.read<TabsCubit>().initial(
                                    //     screens: screens,
                                    //     titles: titles,
                                    //   );
                                    // }
                                    // else {
                                    //   validRole = false;
                                    //   showModalBottomSheet(
                                    //     constraints: BoxConstraints(
                                    //       minWidth: responsiveWidth(
                                    //         context,
                                    //         440,
                                    //       ),
                                    //     ),
                                    //     isScrollControlled: true,
                                    //     context: context,
                                    //     builder: (BuildContext context) {
                                    //       return MsgBottomSheet(
                                    //         title: "",
                                    //         msg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //         imagePath: Svgs.wrong,
                                    //       );
                                    //     },
                                    //   );
                                    // }
                                    // if(validRole){
                                    //   showModalBottomSheet(
                                    //     constraints: BoxConstraints(
                                    //       minWidth: responsiveWidth(context, 440),
                                    //     ),
                                    //     context: context,
                                    //     builder:
                                    //         (context) => MsgBottomSheet(
                                    //       msg: context
                                    //           .read<LocaleCubit>()
                                    //           .getLabelById(id: 1164),
                                    //       title: "",
                                    //       imagePath: Svgs.correct,
                                    //     ),
                                    //   ).then(
                                    //         (value) => Navigator.pushAndRemoveUntil(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //         builder: (context) => HomeScreen(),
                                    //       ),
                                    //           (route) => false,
                                    //     ),
                                    //   );
                                    // }
                                  } else
                                    if (state is LoginErrorState) {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return MsgBottomSheet(
                                          msg: context
                                              .read<LocaleCubit>()
                                              .getLabelById(id: 1152),
                                          title: "",
                                          imagePath: Svgs.wrong,
                                        );
                                      },
                                    );
                                  }
                                },
                                child: BlocBuilder<LoginCubit, LoginState>(
                                  builder: (context, state) {
                                    if (state is LoginLoadingState) {
                                      return LoadingSpinKit();
                                    }
                                    else {
                                      return CustomButton(
                                        label: context
                                            .read<LocaleCubit>()
                                            .getLabelById(id: 1011),
                                        onTap: () {
                                          final code =
                                              context
                                                  .read<LocaleCubit>()
                                                  .currentLocaleCode;
                                          print(
                                            "Current locale code: $code",
                                          ); // e.g., "en"

                                          if (_formKey.currentState!
                                              .validate()) {
                                            context.read<LoginCubit>().login(
                                              nationalId:
                                                  nationalIdController.text,
                                              password: passwordController.text,
                                              code: code,
                                            );
                                          }
                                        },
                                      );
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: responsiveHeight(context, 44)),

                              BlocConsumer<
                                RefreshTokenCubit,
                                RefreshTokenState
                              >(
                                builder: (context, state) {
                                  if (state is RefreshTokenLoadingState) {
                                    return Center(child: LoadingSpinKit());
                                  } else if (state is HideFingerPrintState) {
                                    return SizedBox();
                                  } else {
                                    return FingerprintButton();
                                  }
                                },
                                listener: (context, state) async {
                                  bool validRole = true;
                                  if (state is RefreshTokenLoadedState) {
                                    String roleId = await SecureStorageHelper()
                                        .getPrefString(
                                          key: AppConstants.ROLE_ID,
                                          defaultValue: "0",
                                        );

                                    // context
                                    //     .read<NotificationsCubit>()
                                    //     .fetchNotifications(
                                    //       errorMsg: context
                                    //           .read<LocaleCubit>()
                                    //           .getLabelById(id: 1153),
                                    //     );
                                    //
                                    // if (roleId == AppConstants.driver) {
                                    //   context
                                    //       .read<DriverCurrentTripCubit>()
                                    //       .getDriverCurrentTrip(
                                    //         errorMsg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //       );
                                    //
                                    //   context
                                    //       .read<DriverUpcomingTripCubit>()
                                    //       .getDriverUpcomingTrip(
                                    //         errorMsg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //       );
                                    //
                                    //   context
                                    //       .read<OperationalPlansCubit>()
                                    //       .initialState();
                                    //   context
                                    //       .read<OperationalPlansCubit>()
                                    //       .getOperationalPlans(
                                    //         defaultErrorMsg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //       );
                                    //
                                    //   print("driver");
                                    //   List<Widget> screens = [
                                    //     const DriverCurrentTripsScreen(),
                                    //     const DriverUpcomingTripsScreen(),
                                    //     const DriverOperationalPlansScreen(),
                                    //   ];
                                    //   List<String> titles = [
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1030),
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1031),
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1029),
                                    //   ];
                                    //   context.read<TabsCubit>().initial(
                                    //     screens: screens,
                                    //     titles: titles,
                                    //   );
                                    // } else if (roleId ==
                                    //     AppConstants.transporter) {
                                    //   List<Widget> screens = [
                                    //     OpmOperationalPlansScreen(),
                                    //     const OpmCurrentTripsScreen(),
                                    //     const OpmUpcomingTripsScreen(),
                                    //     const OpmPendingTripsScreen(),
                                    //     const OpmCompletedTripsScreen(),
                                    //   ];
                                    //   List<String> titles = [
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1095),
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1096),
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1108),
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1124),
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1125),
                                    //   ];
                                    //   context
                                    //       .read<DriverCurrentTripCubit>()
                                    //       .getDriverCurrentTrip(
                                    //         errorMsg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //       );
                                    //
                                    //   context
                                    //       .read<DriverUpcomingTripCubit>()
                                    //       .getDriverUpcomingTrip(
                                    //         errorMsg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //       );
                                    //
                                    //   context
                                    //       .read<OperationalPlansCubit>()
                                    //       .initialState();
                                    //   context
                                    //       .read<OperationalPlansCubit>()
                                    //       .getOperationalPlans(
                                    //         defaultErrorMsg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //       );
                                    //   context.read<TabsCubit>().initial(
                                    //     screens: screens,
                                    //     titles: titles,
                                    //   );
                                    // }
                                    // if (roleId == AppConstants.areaManager) {
                                    //   List<Widget> screens = [
                                    //     AreaManagerNewTask(),
                                    //     AreaManagerIncompleteTrip(),
                                    //     AreaManagerCompletedTask(),
                                    //   ];
                                    //   List<String> titles = [
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1193),
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1198),
                                    //     context
                                    //         .read<LocaleCubit>()
                                    //         .getLabelById(id: 1199),
                                    //   ];
                                    //   context.read<TabsCubit>().initial(
                                    //     screens: screens,
                                    //     titles: titles,
                                    //   );
                                    // } else
                                    // {
                                    //   validRole = false;
                                    //   showModalBottomSheet(
                                    //     constraints: BoxConstraints(
                                    //       minWidth: responsiveWidth(
                                    //         context,
                                    //         440,
                                    //       ),
                                    //     ),
                                    //     isScrollControlled: true,
                                    //     context: context,
                                    //     builder: (BuildContext context) {
                                    //       return MsgBottomSheet(
                                    //         title: "",
                                    //         msg: context
                                    //             .read<LocaleCubit>()
                                    //             .getLabelById(id: 1153),
                                    //         imagePath: Svgs.wrong,
                                    //       );
                                    //     },
                                    //   );
                                    // }
                                    // if(validRole){
                                    //   showModalBottomSheet(
                                    //     constraints: BoxConstraints(
                                    //       minWidth: responsiveWidth(context, 440),
                                    //     ),
                                    //     context: context,
                                    //     builder:
                                    //         (context) => MsgBottomSheet(
                                    //       msg: context
                                    //           .read<LocaleCubit>()
                                    //           .getLabelById(id: 1164),
                                    //       title: "",
                                    //       imagePath: Svgs.correct,
                                    //     ),
                                    //   ).then(
                                    //         (value) => Navigator.pushAndRemoveUntil(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //         builder: (context) => HomeScreen(),
                                    //       ),
                                    //           (route) => false,
                                    //     ),
                                    //   );
                                    // }

                                  } else if (state is RefreshTokenErrorState) {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return MsgBottomSheet(
                                          msg: context
                                              .read<LocaleCubit>()
                                              .getLabelById(id: 1153),
                                          title: "",
                                          imagePath: Svgs.wrong,
                                        );
                                      },
                                    );
                                  }
                                },
                              ),

                              SizedBox(height: responsiveHeight(context, 27)),
                              // TextButton(
                              //   onPressed: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder:
                              //             (context) => ForgetPasswordScreen(),
                              //       ),
                              //     );
                              //   },
                              //   child: Text(
                              //     context.read<LocaleCubit>().getLabelById(
                              //       id: 1012,
                              //     ),
                              //     textAlign: TextAlign.center,
                              //     style: Theme.of(
                              //       context,
                              //     ).textTheme.labelMedium!.copyWith(
                              //       decoration: TextDecoration.underline,
                              //     ),
                              //   ),
                              // ),
                              SizedBox(height: responsiveHeight(context, 25)),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Pngs.capLogo,
                              width: responsiveWidth(context, 83),
                              height: responsiveHeight(context, 37),
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: responsiveWidth(context, 30)),
                            Image.asset(
                              Pngs.jeddahLogo,
                              width: responsiveWidth(context, 72),
                              height: responsiveHeight(context, 39),
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                        if (_showText) ...[
                          SizedBox(height: responsiveHeight(context, 10)),
                          Text(
                            "version 1.1.6",
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall!.copyWith(fontSize: 10.sp),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
