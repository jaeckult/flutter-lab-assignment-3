import 'package:equatable/equatable.dart';
import 'package:album/domain/model/albums.dart';

abstract class AlbumState extends Equatable {
  const AlbumState();
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
