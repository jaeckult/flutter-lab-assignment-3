import 'package:album/domain/model/albums.dart';

abstract class IAlbumsRepository {
  Future<List<Album>> getAllAlbums();
}
