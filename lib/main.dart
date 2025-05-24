import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:album/application/bloc/album_bloc.dart';
import 'package:album/application/bloc/photos_bloc.dart';
import 'package:album/navigation/router.dart';
import 'package:album/data/repository/albums_repositoryImpl.dart';
import 'package:album/data/datasource/album_remote_datasourceImpl.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final albumsRepository = AlbumsRepositoryimpl(
      albumRemoteDataSource: AlbumRemoteDatasourceimpl(http.Client()),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AlbumsBloc(albumsRepository: albumsRepository),
        ),
        BlocProvider(
          create: (context) => PhotosBloc(albumsRepository: albumsRepository),
        ),
      ],
      child: MaterialApp.router(
        title: 'Album App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
