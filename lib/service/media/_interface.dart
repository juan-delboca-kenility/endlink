import 'package:enterprise_endlink/model/endlink_model.dart';
import 'package:enterprise_endlink/model/video_model.dart';

abstract class MediaService {
  Future<List<VideoMediaModel>> fetchMedia(String securityCode);
  Future<String> fetchVtt(String url);
  Future<EndlinkModel> fetchEndlink(String securityCode);
}
