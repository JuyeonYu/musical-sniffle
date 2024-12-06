import 'dart:convert';

// Define a model to parse JSON into Dart object
class Song {
  final String brand;
  final String no;
  final String title;
  final String singer;
  final String composer;
  final String lyricist;
  final String release;

  Song({
    required this.brand,
    required this.no,
    required this.title,
    required this.singer,
    required this.composer,
    required this.lyricist,
    required this.release,
  });

  // Factory method to create Song from JSON
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      brand: json['brand'],
      no: json['no'],
      title: json['title'],
      singer: json['singer'],
      composer: json['composer'],
      lyricist: json['lyricist'],
      release: json['release'],
    );
  }

  // Convert a Song object back to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'no': no,
      'title': title,
      'singer': singer,
      'composer': composer,
      'lyricist': lyricist,
      'release': release,
    };
  }
}

// Function to parse a list of songs from a JSON string
List<Song> parseSongs(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Song>((json) => Song.fromJson(json)).toList();
}