import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget desktopLayout;
  final Widget mobileLayout;
  final Widget tabletLayout;
  const Responsive(
      {super.key,
      required this.desktopLayout,
      required this.mobileLayout,
      required this.tabletLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileLayout;
        } else if (constraints.maxWidth > 600) {
          return tabletLayout;
        } else {
          return desktopLayout;
        }
      },
    );
  }
}
