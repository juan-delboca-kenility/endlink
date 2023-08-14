class VideoMediaModel {
  final String url;
  final String thumbnail;
  final String captionsUrl;
  final String title;
  final String summary;
  final int ordinal;

  VideoMediaModel({
    this.url = "",
    this.thumbnail = "",
    this.captionsUrl = "",
    this.title = "",
    this.summary = "",
    this.ordinal = 0,
  });

  factory VideoMediaModel.fromJson(Map<String, dynamic> json) {
    return VideoMediaModel(
      url: json['url'] ?? "",
      thumbnail: json['thumbnail'] ?? "",
      captionsUrl: json['captionsUrl'] ?? "",
      title: json['title'] ?? "",
      summary: json['summary'] ?? "",
      ordinal: json['ordinal'] ?? 0,
    );
  }
}
