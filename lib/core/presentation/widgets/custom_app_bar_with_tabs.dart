import 'package:flutter/material.dart';

class CustomAppBarWithTabs extends StatelessWidget
    implements PreferredSizeWidget {
  final double screenHeight;
  final bool isScrollable;
  final double screenWidth;
  final List<Widget> tabs;
  final List<Widget>? actions;
  final String title;

  const CustomAppBarWithTabs({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.tabs,
    this.actions,
    required this.title,
    required this.isScrollable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: Color(0x4C80808D)),
          top: BorderSide(color: Color(0x4C80808D)),
          right: BorderSide(color: Color(0x4C80808D)),
          bottom: BorderSide(
            width: 0.50,
            color: Color(0x4C80808D),
          ),
        ),
      ),
      child: AppBar(
        titleSpacing: screenWidth * 0.05581395348,
        title: Text(title),
        actions: actions,
        bottom: PreferredSize(

          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            height: screenHeight * 0.04287245444,
            margin: EdgeInsets.only(
              left: screenWidth * 0.05581395348,
              right: screenWidth * 0.05581395348,
              bottom: screenHeight * 0.01286173633,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TabBar(

              isScrollable: isScrollable,
              tabAlignment: TabAlignment.center,
              indicatorPadding: const EdgeInsets.all(2),
              tabs: tabs,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (2 * (screenHeight * 0.02572347266)));
}
