import 'package:netflix_app/core/strings/strings.dart';
import 'package:netflix_app/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kbaseUrl/trending/all/day?api_key=$apiKey";
  static const search =
      "$kbaseUrl/search/movie?api_key=$apiKey&language=en-US&query={}&page=1&include_adult=false#";

  static const hotAndNewMovie = '$kbaseUrl/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate';
  static const hotAndNewTv = 
'$kbaseUrl/discover/tv?api_key=$apiKey&language=en-US&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&include_null_first_air_dates=false&with_watch_monetization_types=flatrate&with_status=0&with_type=0';
}
