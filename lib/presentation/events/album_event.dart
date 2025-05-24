import 'package:equatable/equatable.dart';

abstract class AlbumsEvent extends Equatable {
  const AlbumsEvent();
  @override
  List<Object> get props => [];
}
abstract class PhotoEvent extends Equatable {
  const PhotoEvent();
  @override
  List<Object> get props => [];
}

class LoadAlbums extends AlbumsEvent {
  const LoadAlbums();
  @override
  List<Object> get props => [];
}

class LoadPhotos extends PhotoEvent {
  const LoadPhotos();
  @override
  List<Object> get props => [];
}
