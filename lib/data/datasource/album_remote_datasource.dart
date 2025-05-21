import 'package:album/domain/model/albums.dart';

abstract class IAlbumRemoteDataSource {
  Future<List<Album>> fetchAlbums();
}
