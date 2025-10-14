import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'package:madinati/features/onboarding/presentation/widget/build_intro_widget.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/pngs.dart';
import '../../../../core/constants/svgs.dart';
import '../../../../core/constants/validation.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/custom_textfield.dart';
import '../../../../core/utils/secure_storage_helper.dart';
import '../../../core/locale/presentation/bottom_sheet/lang_bottom_sheet.dart';
import '../../../core/utils/responsive.dart';
import '../../theme/presentation/cubits/theme_cubit.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
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
  final PageController _pageController = PageController();
  int _activePage = 0;

  List<Map<String, dynamic>> get _pages => [
    {
      'title': 'welcome_message_1',
      'image': Pngs.onBoarding_1,
      'description': "description_1",
      'skip': true,
      'slider': Svgs.dots_1,
    },
    {
      'title': 'welcome_message_1',
      'image': Pngs.onBoarding_2,
      'description': 'description_2',
      'skip': true,
      'slider': Svgs.dots_2,
    },

    {
      'title': 'welcome_message_1',

      'image': Pngs.onBoarding_3,
      'description': 'description_3',
      'skip': false,
      'slider': Svgs.dots_3,
    },
  ];

  void initializeAnimations() {
    // Top slide animation (initial to top)
    _topAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _topSlideAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _topAnimationController,
            curve: Curves.easeInOut,
          ),
        );

    // Bottom slide animation
    _bottomAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _bottomSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
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
    _logoSlideAnimation =
        Tween<Offset>(
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
    _rowToBottomAnimation =
        Tween<Offset>(
          begin: const Offset(0, -0.55), // Start from top position
          end: const Offset(0, 0.38), // Move to bottom
        ).animate(
          CurvedAnimation(
            parent: _rowToBottomController,
            curve: Curves.easeInOut,
          ),
        );

    // AppBar fade-in animation
    _appBarFadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _appBarFadeAnimation =
        Tween<double>(
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
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(responsiveHeight(context, 100)),
      //   child: FadeTransition(
      //     opacity: _appBarFadeAnimation,
      //     child: AppBar(
      //       toolbarHeight: responsiveHeight(context, 60),
      //       iconTheme: Theme.of(
      //         context,
      //       ).appBarTheme.iconTheme!.copyWith(size: 18.sp),
      //       title: Text("context.read<LocaleCubit>().getLabelById(id: 1007)"),
      //       centerTitle: true,
      //       actionsPadding: EdgeInsets.zero,
      //       // actions: [LangBottomSheet(screenWidth: responsiveWidth(context, value),screenHeight: null,)],
      //       automaticallyImplyLeading: false,
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
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
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  height: responsiveHeight(context, 362),
                  width: responsiveWidth(context, 257),
                  child: context.read<ThemeCubit>().isDarkTheme
                      ? Image.asset(Pngs.bottom, fit: BoxFit.cover)
                      : Image.asset(Pngs.bottomLight, fit: BoxFit.cover),
                ),
              ),
            ),
          ),

          /// Login form
          if (_showText)
            PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                var pageData = _pages[index];
                return BuildIntroWidget(
                  pageData: pageData,
                  isLastPage: index == _pages.length - 1,
                  activePage: _activePage,
                  pageController: _pageController,
                  pages: _pages,
                );
              },
            ),
        ],
      ),
    );
  }
}
