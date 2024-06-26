import 'package:flexii/dashboard/model/model.dart';
import 'package:flexii/dashboard/view_model/dash_b/view_model.dart';
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
    final center = ref.watch(centerProvider);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text(center.name),
          Text(center.owner),
          Text(center.location),
          Text(center.noMembers.toString()),
          Text(center.noTeams.toString()),
          Text(center.pinCode.toString()),
          Container(
            height: 50, // Set a fixed height for the horizontal ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: center.amenities.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Chip(
                    label: Text(center.amenities[index]),
                    avatar: Icon(Icons.sunny),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
