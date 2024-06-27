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
            amenities: ["AC", "CCTV"],
            imgLink: "https://s3-alpha-sig.figma.com/img/49a2/8290/f698d840da01ca54014f91331eb798a5?Expires=1720396800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=luskwMsY7k0HwY4w7XumE3U0YRq57Vf~5PwGCpDqXpC1aOUdRbagGM9C2jBIHYuJ8DkppMc0pw06bim3vqMkKFaDibnZb1CFnSqileQQQHfi06uzQnPaODSz3NVAlKhMf35YuHVZ9AFlIRlmzQMZVkAsHT33UhnkzL8Xz5bizvagBLiKyvKItnlTHu2br~MiysoEz~BIfsI5LSnosO3JwmZAOenQT1Bv4tspaJwsSL0f4e2bShM46GNPqNbeqpoHMAqgvUu15IVx7dDILK4hDgNsF8DI974TqR~ybSaI4rY5Ytid0MwNqalrtkW4oG2gYKhgJbyHcHbSWEi8nR5bOg__"));
  // add all the methods to edit that class instance
}
