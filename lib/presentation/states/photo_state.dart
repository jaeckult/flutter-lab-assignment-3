import 'package:equatable/equatable.dart';
import 'package:album/domain/model/photos.dart';

abstract class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotosLoading extends PhotoState {}

class PhotosLoaded extends PhotoState {
  final List<Photo> photos;

  const PhotosLoaded(this.photos);

  @override
  List<Object> get props => [photos];
}

class PhotosError extends PhotoState {
  final String message;

  const PhotosError(this.message);

  @override
  List<Object> get props => [message];
} 