import 'dart:convert';
import 'package:species/src/data/models/indigenous_community_iiap/community_community_iiap.dart';

IndigenousCommunityIiapResponse villagesIndigenousVillagesIiapResponseFromJson(String str) => IndigenousCommunityIiapResponse.fromJson(json.decode(str));

String villagesIndigenousVillagesIiapResponseToJson(IndigenousCommunityIiapResponse data) => json.encode(data.toJson());

class IndigenousCommunityIiapResponse {
    final List<CommunityCommunityIiap> pueblosIndigenas;
    final int currentPage;
    final int totalPages;
    final int totalItems;

    IndigenousCommunityIiapResponse({
        required this.pueblosIndigenas,
        required this.currentPage,
        required this.totalPages,
        required this.totalItems,
    });

    factory IndigenousCommunityIiapResponse.fromJson(Map<String, dynamic> json) => IndigenousCommunityIiapResponse(
        pueblosIndigenas: List<CommunityCommunityIiap>.from(json["pueblosIndigenas"].map((x) => CommunityCommunityIiap.fromJson(x))),
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
        totalItems: json["totalItems"],
    );

    Map<String, dynamic> toJson() => {
        "pueblosIndigenas": List<dynamic>.from(pueblosIndigenas.map((x) => x.toJson())),
        "currentPage": currentPage,
        "totalPages": totalPages,
        "totalItems": totalItems,
    };
}
