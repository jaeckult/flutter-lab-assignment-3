import 'package:bloc/bloc.dart';
import 'package:album/domain/repository/albums_repo.dart';
import 'package:album/presentation/events/photo_event.dart';
import 'package:album/presentation/states/photo_state.dart';
import 'package:album/domain/model/photos.dart';

class PhotosBloc extends Bloc<PhotoEvent, PhotoState> {
  final IAlbumsRepository albumsRepository;

  PhotosBloc({required this.albumsRepository}) : super(PhotosLoading()) {
    on<LoadPhotosByAlbumId>(_onFetchPhotosByAlbumId);
  }

  Future<void> _onFetchPhotosByAlbumId(
    LoadPhotosByAlbumId event,
    Emitter<PhotoState> emit,
  ) async {
    emit(PhotosLoading());
    try {
      final photos = await albumsRepository.getAllPhotos();
      final albumPhotos = photos.where((photo) => photo.albumId == event.albumId).toList();
      emit(PhotosLoaded(albumPhotos));
    } catch (e) {
      // Create a default photo with placeholder image
      final defaultPhoto = Photo(
        id: 0,
        albumId: event.albumId,
        title: 'Unable to load photos',
        url: Photo.defaultImageUrl,
        thumbnailUrl: Photo.defaultImageUrl,
      );
      emit(PhotosLoaded([defaultPhoto]));
    }
  }
} 