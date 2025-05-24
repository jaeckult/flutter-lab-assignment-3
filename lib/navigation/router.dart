import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:album/presentation/screens/albumListPage.dart';
import 'package:album/presentation/screens/photos.screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AlbumListPage(),
    ),
    GoRoute(
      path: '/photos/:albumId',
      builder: (context, state) {
        final albumId = int.parse(state.pathParameters['albumId']!);
        return PhotosPage(albumId: albumId);
      },
    ),
  ],
); 