class Video {
  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  Video(
    this.id,
    this.titulo,
    this.descricao,
    this.imagem,
    this.canal,
  );

  // static converterJson(Map<String, dynamic> json) {
  //   return Video(
  //     json["id"]["videoId"],
  //     json["snippet"]["title"],
  //     json["snippet"]["description"],
  //     json["snippet"]["thumbnails"]["high"]["url"],
  //     json["snippet"]["channelId"]
  //   );
  // }

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      json["id"]["videoId"],
      json["snippet"]["title"],
      json["snippet"]["description"],
      json["snippet"]["thumbnails"]["high"]["url"],
      json["snippet"]["channelId"],
    );
  }
}
