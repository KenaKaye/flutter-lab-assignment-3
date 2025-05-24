import 'package:flutter/material.dart';
import '../../data/models/album.dart';

class AlbumListItem extends StatelessWidget {
  final Album album;
  final VoidCallback onTap;

  const AlbumListItem({required this.album, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(album.title),
      leading: const Icon(Icons.album),
      onTap: onTap,
    );
  }
}