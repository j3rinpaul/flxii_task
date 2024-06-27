// SafeArea(
//           child: Column(
//         children: [
//           Image.network(
//             center.imgLink,
//             height: 200,
//             width: double.infinity,
//             fit: BoxFit.cover,
//             loadingBuilder: (BuildContext context, Widget child,
//                 ImageChunkEvent? loadingProgress) {
//               if (loadingProgress == null) {
//                 return child;
//               } else {
//                 return Center(
//                   child: CircularProgressIndicator(
//                     value: loadingProgress.expectedTotalBytes != null
//                         ? loadingProgress.cumulativeBytesLoaded /
//                             (loadingProgress.expectedTotalBytes ?? 1)
//                         : null,
//                   ),
//                 );
//               }
//             },
//             errorBuilder: (BuildContext context, Object exception,
//                 StackTrace? stackTrace) {
//               return Text('Failed to load image');
//             },
//           ),
//           Text(center.name),
//           Text(center.owner),
//           Text(center.location),
//           Text(center.noMembers.toString()),
//           Text(center.noTeams.toString()),
//           Text(center.pinCode.toString()),
//           Container(
//             height: 50, // Set a fixed height for the horizontal ListView
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: center.amenities.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Chip(
//                     label: Text(center.amenities[index]),
//                     avatar: Icon(Icons.sunny),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ))