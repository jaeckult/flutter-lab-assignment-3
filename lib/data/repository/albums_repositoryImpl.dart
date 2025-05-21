import 'package:album/domain/repository/albums_repo.dart';
import 'package:album/domain/model/albums.dart';
import 'package:album/data/datasource/album_remote_datasource.dart';

class AlbumsRepositoryimpl implements IAlbumsRepository {
  final IAlbumRemoteDataSource albumRemoteDataSource;

  AlbumsRepositoryimpl({required this.albumRemoteDataSource});

  @override
  Future<List<Album>> getAllAlbums() async {
    return await albumRemoteDataSource.fetchAlbums();
  }
}
