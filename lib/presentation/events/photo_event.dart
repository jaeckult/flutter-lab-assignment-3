import 'package:equatable/equatable.dart';

abstract class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

class LoadPhotosByAlbumId extends PhotoEvent {
  final int albumId;

  const LoadPhotosByAlbumId({required this.albumId});

  @override
  List<Object> get props => [albumId];
} 