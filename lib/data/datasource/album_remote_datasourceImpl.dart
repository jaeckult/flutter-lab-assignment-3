import 'dart:convert';
import 'package:album/domain/model/photos.dart';
import 'package:http/http.dart' as http;
import 'package:album/domain/model/albums.dart';
import 'package:album/data/datasource/album_remote_datasource.dart';

class AlbumRemoteDatasourceimpl implements IAlbumRemoteDataSource {
  final http.Client httpClient;

  AlbumRemoteDatasourceimpl(this.httpClient);

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

  @override
  Future<List<Photo>> fetchPhotos() async {
    try {
      print('RemoteDataSource: Making HTTP request to fetch photos...');
      final response = await httpClient.get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos'),
      );
      print('RemoteDataSource: Response status code: ${response.statusCode}');
      print('RemoteDataSource: Response body: ${response.body.substring(0, 200)}...'); // Print first 200 chars

      if (response.statusCode == 200) {
        final List<dynamic> photoJson = jsonDecode(response.body);
        print('RemoteDataSource: Successfully parsed ${photoJson.length} photos from JSON');
        return photoJson.map((json) => Photo.fromJson(json)).toList();
      } else {
        throw Exception('Error fetching photos: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      print('RemoteDataSource Error: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }
}
