import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API = "AIzaSyAaEY1Rg0elo9nIbz4qsrUCgflfy3mC8Fc";
const ID_CANAL = "edublinTV";
const URL_BASE = "https://www.googleapis.com/youtube/v3";

class Api {
  pesquisar(String pesquisar) async {
    http.Response response = await http.get(Uri.parse(
      URL_BASE + "/search",
    ));
  }
}
