import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:album/presentation/screens/albumListPage.dart';
import 'package:album/application/bloc/album_bloc.dart';
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
    return MaterialApp(
      title: 'Albums App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => AlbumsBloc(
          albumsRepository: AlbumsRepositoryimpl(
            albumRemoteDataSource: BookingsRemoteDataSourceImpl(http.Client()),
          ),
        ),
        child: const Albumlistpage(),
      ),
    );
  }
}
