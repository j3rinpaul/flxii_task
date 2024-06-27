import 'package:flexii/core/responsive.dart';
import 'package:flexii/core/utils.dart';
import 'package:flexii/dashboard/model/model.dart';
import 'package:flexii/dashboard/view/sidebar/sidebar_desktop.dart';
import 'package:flexii/dashboard/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final centerProvider =
    StateNotifierProvider<CenterDetailNotifier, CenterDetails>((ref) {
  return CenterDetailNotifier();
});

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
            backgroundColor: Design.primaryColor,
              child: DesktopSidebar()),
      appBar: AppBar(
        backgroundColor: Design.primaryColor,
        title: Text("Test"),
        leading: isDesktop
            ? null
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
            if (isDesktop)
              Expanded(flex: 2, child: DesktopSidebar()),
            Expanded(
              flex: 7,
              child: Container(
                color: Design.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
