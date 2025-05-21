import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:album/domain/model/albums.dart';
import 'package:album/data/datasource/album_remote_datasource.dart';

class BookingsRemoteDataSourceImpl implements IAlbumRemoteDataSource {
  final http.Client httpClient;

  BookingsRemoteDataSourceImpl(this.httpClient);

  @override
  Future<List<Album>> fetchAlbums() async {
    final response = await httpClient.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> albumJson = jsonDecode(response.body);
      return albumJson.map((json) => Album.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching albums');
    }
  }
}
