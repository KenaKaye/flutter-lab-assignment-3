import 'package:equatable/equatable.dart';
import '../../../data/models/album.dart';

abstract class AlbumState extends Equatable {
  @override
  List<Object> get props => [];
}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumLoaded extends AlbumState {
  final List<Album> albums;

  AlbumLoaded(this.albums);

  @override
  List<Object> get props => [albums];
}

class AlbumError extends AlbumState {
  final String message;

  AlbumError(this.message);

  @override
  List<Object> get props => [message];
}