import 'package:flutter/material.dart';

import '../../../../core/constants/pngs.dart';
import '../../../../core/constants/svgs.dart';
import 'intro_widget.dart';

class BuildIntroWidget extends StatefulWidget {
  final Map<String, dynamic> pageData;
  final bool isLastPage;
  int? activePage;
  final PageController pageController;
  final List<Map<String, dynamic>> pages;

  BuildIntroWidget({
    super.key,
    required this.isLastPage,
    required this.pageData,
    required this.activePage,
    required this.pageController,
    required this.pages,
  });

  @override
  State<BuildIntroWidget> createState() => _BuildIntroWidgetState();
}

class _BuildIntroWidgetState extends State<BuildIntroWidget> {
  @override
  Widget build(BuildContext context) {
    return IntroWidget(
      title: widget.pageData['title'],
      description: widget.pageData['description'],
      image: widget.pageData['image'],
      skip: widget.pageData['skip'],
      isLastPage: widget.isLastPage,
      onNext: _onNextPage,
      onSkip: _onSkipPage,
      onOk: _onOk,
      slider: widget.pageData['slider'],
    );
  }

  // Navigate to the next page in the PageView
  void _onNextPage() {
    if (widget.activePage! < widget.pages.length - 1) {
      widget.pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }
  }

  // Skip to the last page in the PageView
  void _onSkipPage() {
    setState(() {
      widget.activePage =
          widget.pages.length - 1; // Set the active page to the last page
    });
    widget.pageController.jumpToPage(
      widget.activePage!,
    ); // Jump to the last page
  }

  // Navigate to the new screen
  void _onOk() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const Text("data"), // Replace with the desired screen
      ),
    );
  }
}
