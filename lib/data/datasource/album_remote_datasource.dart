import 'package:album/domain/model/albums.dart';
import 'package:album/domain/model/photos.dart';
abstract class IAlbumRemoteDataSource {
  Future<List<Album>> fetchAlbums();
  Future<List<Photo>> fetchPhotos();
}
