import 'package:flexii/admin/view/content/dashboard.dart';
import 'package:flexii/admin/view/sidebar/sidebar_desktop.dart';
import 'package:flexii/core/responsive.dart';
import 'package:flexii/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashBoard extends ConsumerWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDesktop = Responsive.isDesktop(context);
    return Scaffold(
      backgroundColor: Design.primaryColor,
      drawer: isDesktop
          ? null
          : Drawer(
              backgroundColor: Design.primaryColor, child: DesktopSidebar()),
      appBar: AppBar(
        backgroundColor: Design.primaryColor,
        title: Text(
          "Test",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 46),
        ),
        leading: isDesktop
            ? Icon(Icons.circle)
            : Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
      ),
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop) Expanded(flex: 3, child: DesktopSidebar()),
            Expanded(flex: 7, child: DashBoardDetial()),
          ],
        ),
      ),
    );
  }
}
