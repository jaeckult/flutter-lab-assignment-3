import 'package:album/domain/repository/albums_repo.dart';
import 'package:album/domain/model/albums.dart';
import 'package:album/data/datasource/album_remote_datasource.dart';
import 'package:album/domain/model/photos.dart';

class AlbumsRepositoryimpl implements IAlbumsRepository {
  final IAlbumRemoteDataSource albumRemoteDataSource;

  AlbumsRepositoryimpl({required this.albumRemoteDataSource});

  @override
  Future<List<Album>> getAllAlbums() async {
    return await albumRemoteDataSource.fetchAlbums();
  }

  @override
  Future<List<Photo>> getAllPhotos() async {
    try {
      print('Repository: Fetching photos from remote data source...');
      final photos = await albumRemoteDataSource.fetchPhotos();
      print('Repository: Successfully fetched ${photos.length} photos');
      return photos;
    } catch (e, stackTrace) {
      print('Repository Error: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }
}

