import 'package:bloc/bloc.dart';
import 'package:album/domain/repository/albums_repo.dart';
import 'package:album/presentation/events/album_event.dart';
import 'package:album/presentation/states/album_state.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumState> {
  final IAlbumsRepository albumsRepository;

  AlbumsBloc({required this.albumsRepository}) : super(AlbumsLoading()) {
    on<LoadAlbums>(_onFetchAlbums);
  }

  Future<void> _onFetchAlbums(
    LoadAlbums event,
    Emitter<AlbumState> emit,
  ) async {
    emit(AlbumsLoading());
    try {
      final bookings = await albumsRepository.getAllAlbums();
      emit(AlbumsLoaded(albums: bookings));
    } catch (e) {
      emit(AlbumsError(message: e.toString()));
    }
  }
  Future<void> _onFetchPhotos(
    LoadPhotos event,
    Emitter<PhotoState> emit,
  ) async {
    emit(PhotosLoading());
    try {
      final photos = await albumsRepository.getAllPhotos();
      emit(PhotosLoaded(photos: photos));
    } catch (e) {
      emit(PhotosError(message: e.toString()));
    }
  }
}
