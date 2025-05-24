import 'package:album/domain/model/albums.dart';
import 'package:album/domain/model/photos.dart';
abstract class IAlbumsRepository {
  Future<List<Album>> getAllAlbums();
  Future<List<Photo>> getAllPhotos();
}
