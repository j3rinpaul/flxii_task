import 'dart:convert';

class CenterDetails {
    String name;
    String location;
    int pinCode;
    String owner;
    int noTeams;
    int noMembers;
    List<String> amenities;
    String imgLink;

    CenterDetails({
        required this.name,
        required this.location,
        required this.pinCode,
        required this.owner,
        required this.noTeams,
        required this.noMembers,
        required this.amenities,
        required this.imgLink
    });

    CenterDetails copyWith({
        String? name,
       String? location,
        int? pinCode,
        String? owner,
        int? noTeams,
        int? noMembers,
        List<String>? amenities,
        String? imgLink
    }) => 
        CenterDetails(
            name: name ?? this.name,
            location: location ?? this.location,
            pinCode: pinCode ?? this.pinCode,
            owner: owner ?? this.owner,
            noTeams: noTeams ?? this.noTeams,
            noMembers: noMembers ?? this.noMembers,
            amenities: amenities ?? this.amenities,
            imgLink: imgLink?? this.imgLink
        );

    factory CenterDetails.fromRawJson(String str) => CenterDetails.fromJson(json.decode(str));

   

    factory CenterDetails.fromJson(Map<String, dynamic> json) => CenterDetails(
        name: json["name"],
        location: json["location"],
        pinCode: json["pinCode"],
        owner: json["owner"],
        noTeams: json["noTeams"],
        noMembers: json["noMembers"],
        amenities: List<String>.from(json["amenities"].map((x) => x)),
        imgLink: json["imgLink"]
    );

   
}