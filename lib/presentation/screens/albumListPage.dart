import 'package:album/application/bloc/album_bloc.dart';
import 'package:album/presentation/events/album_event.dart';
import 'package:album/presentation/states/album_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:album/domain/model/albums.dart';

class Albumlistpage extends StatefulWidget {
  const Albumlistpage({super.key});

  @override
  State<Albumlistpage> createState() => _AlbumlistpageState();
}

class _AlbumlistpageState extends State<Albumlistpage> {
  @override
  void initState() {
    super.initState();
    context.read<AlbumsBloc>().add(const LoadAlbums());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: BlocBuilder<AlbumsBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AlbumsLoaded) {
            return ListView.builder(
              itemCount: state.albums.length,
              itemBuilder: (context, index) {
                final Album album = state.albums[index];
                return ListTile(
                  title: Text(album.title),
                  subtitle: Text('User ID: ${album.userId}'),
                );
              },
            );
          } else if (state is AlbumsError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
