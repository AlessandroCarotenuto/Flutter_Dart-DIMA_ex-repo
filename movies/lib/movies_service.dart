import "dart:convert";
import "package:http/http.dart" as http;

const apiKey = "b8c79639";
const endpoint = "https://www.omdbapi.com";

searchMovies(String query) async {
  if (query == "") {
    return [];
  }

  var response =
      await http.get(Uri.parse(endpoint + "?apikey=" + apiKey + "&s=" + query));
  final responseJson = json.decode(response.body);

  if (responseJson["Search"] != null) {
    return responseJson["Search"]
        .where((movie) => movie["Poster"] != "N/A")
        .toList();
  }

  return []; //it's a future of a List, aync func
}
