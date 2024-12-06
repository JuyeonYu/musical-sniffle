import 'package:mike_list/api_path.dart';
import 'package:mike_list/song.dart';
import 'package:http/http.dart' as http;

class SongApiService {
    Future<List<Song>> fetchItems() async {
      
    final response = await http.get(Uri.parse('https://api.manana.kr/karaoke/release/202404/kumyoung.json'));

    if (response.statusCode == 200) {
      // If the server returns a successful response, parse the JSON
      return parseSongs(response.body);
    } else {
      // If the server does not return a successful response, throw an error
      throw Exception('Failed to load items');
    }
  }

}