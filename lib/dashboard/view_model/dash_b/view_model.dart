import 'package:flexii/dashboard/model/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CenterDetailNotifier extends StateNotifier<CenterDetails> {
  CenterDetailNotifier()
      : super(CenterDetails(
            name: "Flexi",
            location: "Kakkanad,Kochi",
            pinCode: 688008,
            owner: "Vishnu",
            noTeams: 6,
            noMembers: 18,
            amenities: ["AC", "CCTV"]));
  // add all the methods to edit that class instance
}
