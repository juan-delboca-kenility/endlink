// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:enterprise_endlink/model/video_model.dart';
// import 'package:enterprise_endlink/service/http/_interface.dart';
// import 'package:enterprise_endlink/service/media/_interface.dart';
//
// class MediaServiceImpl extends MediaService {
//   final HttpService httpService;
//   final String baseURL;
//
//   MediaServiceImpl({
//     required this.baseURL,
//     required this.httpService,
//   });
//
//   @override
//   Future<List<VideoMediaModel>> fetchMedia(String accountUID, String securityCode) async {
//     final response = await httpService.get(
//       Uri.parse("$baseURL/api/$accountUID/endlink/$securityCode"),
//     );
//     return (response.data as List<dynamic>).map(_parseVideoModel).where((e) => e != null).map((e) => e!).toList();
//   }
//
//   VideoMediaModel? _parseVideoModel(dynamic json) {
//     try {
//       return
//         VideoMediaModel.fromJson(jsonDecode(jsonEncode(json)));
//     } catch (error, stack) {
//       log("Error parsing ImageMediaModel", error: error, stackTrace: stack);
//       return null;
//     }
//   }
// }