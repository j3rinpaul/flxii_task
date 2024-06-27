import 'package:flexii/core/responsive.dart';
import 'package:flexii/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectProvider = StateProvider<int>(
  (ref) => 1,
);

void updateSelection(int n, WidgetRef ref) {
  ref.read(selectProvider.notifier).update(
        (state) => n,
      );
}

class DesktopSidebar extends ConsumerWidget {
  const DesktopSidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.watch(selectProvider);
    return ListView(
      padding: EdgeInsets.all(50),
      children: [
        
        ListTile(
          title: Text(
            'Dashboard',
            style: TextStyle(
              color:
                  selection == 0 ? Design.primaryColor : Design.amenitiesColor,
            ),
          ),
          selected: selection == 0,
          shape: selection == 0
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              : null,
          selectedTileColor: Design.amenitiesColor,
          onTap: () {
            updateSelection(0, ref);
          },
        ),
        ListTile(
          title: Text(
            'Center',
            style: TextStyle(
              color:
                  selection == 1 ? Design.primaryColor : Design.amenitiesColor,
            ),
          ),
          selected: selection == 1,
          shape: selection == 1
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              : null,
          selectedTileColor: Design.amenitiesColor,
          onTap: () {
            updateSelection(1, ref);
          },
        ),
        ListTile(
          title: Text(
            'Admin',
            style: TextStyle(
              color:
                  selection == 2 ? Design.primaryColor : Design.amenitiesColor,
            ),
          ),
          selected: selection == 2,
          shape: selection == 2
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              : null,
          selectedTileColor: Design.amenitiesColor,
          onTap: () {
            updateSelection(2, ref);
          },
        ),
        ListTile(
          title: Text(
            'Status',
            style: TextStyle(
              color:
                  selection == 3 ? Design.primaryColor : Design.amenitiesColor,
            ),
          ),
          selected: selection == 3,
          shape: selection == 3
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )
              : null,
          selectedTileColor: Design.amenitiesColor,
          onTap: () {
            updateSelection(3, ref);
          },
        ),
        SizedBox(height: Responsive.bottom(context)), //

        // Bottom list tile
        ListTile(
          title: Text('Settings'),
          onTap: () {},
        ),
        SizedBox(
          height: 5,
        ),
        ListTile(
          title: Text(
            'Sudo',
            style: TextStyle(
              color: Design.primaryColor,
            ),
          ),
          leading: Icon(
            Icons.person,
            color: Design.primaryColor,
          ),
          selected: true,
          selectedTileColor: Design.amenitiesColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: BorderSide(color: Colors.white, width: 2.0),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
