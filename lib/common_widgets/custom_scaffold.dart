import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.hasSafeArea = false,
    this.statusBarColor,
    this.backgroundColor,
  });

  final bool hasSafeArea;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Color? statusBarColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final appBar = this.appBar != null
        ? this.appBar!
        : PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              elevation: 0,
              shadowColor: Colors.transparent,
              scrolledUnderElevation: 0,
              backgroundColor: statusBarColor,
            ),
          );

    final scaffold = Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor,
      
    );

    return hasSafeArea ? SafeArea(child: scaffold) : scaffold;
  }
}
