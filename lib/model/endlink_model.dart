import 'dart:convert';
import 'dart:developer';

import 'package:enterprise_endlink/model/video_model.dart';

class EndlinkModel {
  final String title;
  final String jobService;
  final int lastUpdate;
  final List<VideoMediaModel>? videos;

  EndlinkModel({
    this.title = "",
    this.jobService = "",
    this.lastUpdate = 0,
    this.videos,
  });

  factory EndlinkModel.fromJson(Map<String, dynamic> json) {
    return EndlinkModel(
      title: json['title'] ?? "",
      jobService: json['jobService'] ?? "",
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
