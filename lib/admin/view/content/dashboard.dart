import 'package:flexii/admin/view/content/center/center_details.dart';
import 'package:flexii/admin/view/sidebar/sidebar_desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashBoardDetial extends ConsumerWidget {
  const DashBoardDetial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dash = ref.watch(selectProvider);
    switch (dash) {
      case 0:
        return Error404();
      case 1:
        return CenterDetail();
      case 2:
        return Error404();
      case 3:
        return Error404();
      default:
        return Error404();
    }
  }
}

class Error404 extends StatelessWidget {
  const Error404({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("assets/images/error.jpeg"),
    );
  }
}
