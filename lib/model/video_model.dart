class VideoMediaModel {
  final String url;
  final String thumbnail;
  final String title;
  final String description;
  final int ordinal;

  VideoMediaModel({
    this.url = "",
    this.thumbnail = "",
    this.title = "",
    this.description = "",
    this.ordinal = 0,
  });

  factory VideoMediaModel.fromJson(Map<String, dynamic> json) {
    return VideoMediaModel(
      url: json['url'] ?? "",
      thumbnail: json['thumbnail'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      ordinal: json['ordinal'] ?? 0,
    );
  }
}
