import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyAaEY1Rg0elo9nIbz4qsrUCgflfy3mC8Fc";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    String url = URL_BASE +
        "/search" +
        "?key=$CHAVE_YOUTUBE_API" +
        "&type=video" +
        "&maxResults=20" +
        "&order=date" +
        "&q=$pesquisa" +
        "&channelId=$ID_CANAL" +
        "&part=snippet";

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();
      return videos;
    } else {
      return [];
    }
  }
}
