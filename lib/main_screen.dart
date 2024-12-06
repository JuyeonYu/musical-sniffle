import 'package:flutter/material.dart';
import 'package:mike_list/song.dart';
import 'package:mike_list/song_api_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<List<Song>> songs;

  @override
  void initState() {
    super.initState();
    songs = SongApiService().fetchItems(); // song_api_service에서 노래 목록 가져오기
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Song List'),
      ),
      body: FutureBuilder<List<Song>>(
        future: songs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No songs found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final song = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    leading: Icon(Icons.music_note, size: 40, color: Colors.deepPurple),
                    title: Text(
                      song.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4.0),
                        Text('Singer: ${song.singer}'),
                        Text('Composer: ${song.composer}'),
                        Text('Release: ${song.release}'),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.deepPurple),
                    onTap: () {
                      // 노래 항목을 탭했을 때의 동작을 여기에 추가할 수 있습니다.
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}