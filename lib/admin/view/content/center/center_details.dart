import 'package:flexii/admin/model/model.dart';
import 'package:flexii/admin/view_model/view_model.dart';
import 'package:flexii/core/responsive.dart';
import 'package:flexii/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

double padIn = 80;

final centerProvider =
    StateNotifierProvider<CenterDetailNotifier, CenterDetails>((ref) {
  return CenterDetailNotifier();
});

class CenterDetail extends ConsumerWidget {
  const CenterDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDesktop = Responsive.isDesktop(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      margin: EdgeInsets.only(left: isMobile ? 30 : 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // transformAlignment: Alignment.centerLeft,
            padding: isDesktop
                ? EdgeInsets.all(8.0)
                : EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "Center Details",
              style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w800, height: 4),
            ),
          ),
          ImageNet(),
          TeamMembers(),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              "Amenities",
              style: TextStyle(
                  fontWeight: FontWeight.bold, height: 2, fontSize: 24),
            ),
          ),
          Amenities()
        ],
      ),
    );
  }
}

class ImageNet extends ConsumerWidget {
  const ImageNet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final center = ref.watch(centerProvider);
    final isMobile = Responsive.isMobile(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 200,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(center.imgLink, scale: 50),
                      fit: BoxFit.cover)),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.2),
                    ],
                    begin: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: !isMobile ? padIn : 30),
            child: Details()),
      ],
    );
  }
}

class Details extends ConsumerWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final center = ref.watch(centerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          center.name,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Design.centerColor,
          ),
        ),
        Text(
          center.location,
          style: TextStyle(
              height: 2,
              fontWeight: FontWeight.bold,
              color: Design.centerColor),
        ),
        Text(
          center.pinCode.toString(),
          style: TextStyle(
              height: 2,
              fontWeight: FontWeight.bold,
              color: Design.centerColor),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              color: Design.rectangleColor,
              borderRadius: BorderRadius.circular(10)),
          width: 100,
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.person)),
              Text(center.owner)
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Design.buttonColor),
                foregroundColor: WidgetStateProperty.all(Design.primaryColor),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                  ),
                ),
              ),
              onPressed: () {},
              child: Text("Share"),
            ),
            SizedBox(
              width: 5,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Design.rectangleColor),
                  foregroundColor:
                      WidgetStateProperty.all(Design.amenitiesColor),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust the radius as needed
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Action",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ],
    );
  }
}

class TeamMembers extends ConsumerWidget {
  const TeamMembers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final center = ref.watch(centerProvider);
    final isMobile = Responsive.isMobile(context);

    return Container(
      margin: EdgeInsets.only(top: isMobile ? padIn - 10 : 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            height: 100,
            width: 200,
            decoration: BoxDecoration(
                color: Design.rectangleColor,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "${center.noTeams.toString()} Teams ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40),
            padding: EdgeInsets.all(!isMobile ? 20 : 10),
            alignment: Alignment.center,
            height: 100,
            width: !isMobile ? 300 : 200,
            decoration: BoxDecoration(
                color: Design.rectangleColor,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "${center.noMembers.toString()} Members ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ),
        ],
      ),
    );
  }
}

class Amenities extends ConsumerWidget {
  const Amenities({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final center = ref.watch(centerProvider);

    return Container(
      height: 50, // Set a fixed height for the horizontal ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: center.amenities.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 10),
            child: Chip(
              backgroundColor: Design.amenitiesColor,
              label: Text(
                center.amenities[index],
                style: TextStyle(color: Design.primaryColor),
              ),
              avatar: Icon(
                Icons.sunny,
                color: Design.primaryColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
