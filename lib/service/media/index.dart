import 'dart:convert';
import 'dart:developer';

import 'package:enterprise_endlink/model/endlink_model.dart';
import 'package:enterprise_endlink/model/video_model.dart';
import 'package:enterprise_endlink/service/http/_interface.dart';
import 'package:enterprise_endlink/service/media/_interface.dart';

class MediaServiceImpl extends MediaService {
  final HttpService httpService;
  final String baseURL;

  MediaServiceImpl({
    required this.baseURL,
    required this.httpService,
  });

  @override
  Future<List<VideoMediaModel>> fetchMedia(String securityCode) async {
    final response = await httpService.get(
      Uri.parse("$baseURL/api/v1/end_link//$securityCode"),
    );
    return (response.data as List<dynamic>).map(_parseVideoModel).where((e) => e != null).map((e) => e!).toList();
  }

  @override
  Future<EndlinkModel> fetchEndlink(String securityCode) async {
    log('[CHALLENGE] : $baseURL/api/v1/end_link/$securityCode');
    final response = await httpService.get(
      Uri.parse("$baseURL/api/v1/end_link/$securityCode"),
    );
    return EndlinkModel.fromJson(jsonDecode(jsonEncode( (response.data as Map<String,dynamic>))));
  }

  VideoMediaModel? _parseVideoModel(dynamic json) {
    try {
      return
        VideoMediaModel.fromJson(jsonDecode(jsonEncode(json)));
    } catch (error, stack) {
      log("Error parsing ImageMediaModel", error: error, stackTrace: stack);
      return null;
    }
  }

  @override
  Future<String> fetchVtt(String url) async {
    final response = await httpService.get(
      Uri.parse(url),
    );
    return response.data.toString();
  }
}