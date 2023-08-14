import 'dart:convert';
import 'dart:developer';

import 'package:enterprise_endlink/model/video_model.dart';

class EndlinkModel {
  final String title;
  final String jobService;
  final int lastUpdate;
  final String lastName;
  final String name;
  final List<VideoMediaModel>? videos;

  EndlinkModel({
    this.title = "",
    this.jobService = "",
    this.lastName = "",
    this.name = "",
    this.lastUpdate = 0,
    this.videos,
  });

  factory EndlinkModel.fromJson(Map<String, dynamic> json) {
    return EndlinkModel(
      title: json['title'] ?? "",
      jobService: json['jobService'] ?? "",
      lastName: json['customer']['lastName'] ?? "",
      name: json['customer']['name'] ?? "",
      lastUpdate: json['lastUpdate'] ?? 0,
      videos: (json['media']['videos'] as List<dynamic>).map(_parseVideoModel).where((e) => e != null).map((e) => e!).toList(),
    );
  }

  static VideoMediaModel? _parseVideoModel(dynamic json) {
    try {
      return
        VideoMediaModel.fromJson(jsonDecode(jsonEncode(json)));
    } catch (error, stack) {
      log("Error parsing ImageMediaModel", error: error, stackTrace: stack);
      return null;
    }
  }
}
