import 'package:netflix_app/core/strings/strings.dart';
import 'package:netflix_app/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$baseUrl/trending/all/day?api_key=$apiKey";
  static const search =
      "$baseUrl/search/movie?api_key=$apiKey&language=en-US&query={}&page=1&include_adult=false#";
}
