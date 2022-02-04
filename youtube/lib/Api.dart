import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API = "AIzaSyAaEY1Rg0elo9nIbz4qsrUCgflfy3mC8Fc";
const ID_CANAL = "edublinTV";
const URL_BASE = "https://www.googleapis.com/youtube/v3";

class Api {
  pesquisar(String pesquisa) async {
    String url = URL_BASE + "/search";
    // "?part=snippet" +
    // "&type=video" +
    // "&maxResults=20" +
    // "&order=date" +
    // "&key=${CHAVE_YOUTUBE_API}" +
    // "&channelId=${ID_CANAL}";
    // "&q=${pesquisa}"
    print(url);

    http.Response response = await http.get(
      Uri.parse(url),
    );
    print(response.body);
  }
}
