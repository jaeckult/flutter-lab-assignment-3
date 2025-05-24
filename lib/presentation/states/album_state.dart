import 'package:equatable/equatable.dart';
import 'package:album/domain/model/albums.dart';
import 'package:album/domain/model/photos.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();
  @override
  List<Object> get props => [];
}
abstract class PhotoState extends Equatable {
  const PhotoState();
  @override
  List<Object> get props => [];
}

class AlbumsLoading extends AlbumState {}

class AlbumsLoaded extends AlbumState {
  final List<Album> albums;
  const AlbumsLoaded({required this.albums});
  @override
  List<Object> get props => [albums];
}

class AlbumsError extends AlbumState {
  final String message;
  const AlbumsError({required this.message});
  @override
  List<Object> get props => [message];
}
class PhotosLoading extends PhotoState {}

class PhotosLoaded extends PhotoState {
  final List<Photo> photos;
  const PhotosLoaded({required this.photos});
  @override
  List<Object> get props => [photos];
}
class PhotosError extends PhotoState {
  final String message;
  const PhotosError({required this.message});
  @override
  List<Object> get props => [message];
}

