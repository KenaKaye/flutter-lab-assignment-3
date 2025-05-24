import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/photo/photo_bloc.dart';
import '../blocs/photo/photo_event.dart';
import '../blocs/photo/photo_state.dart';

class AlbumDetailScreen extends StatelessWidget {
  final int albumId;
  final String albumTitle;

  const AlbumDetailScreen({required this.albumId, required this.albumTitle, super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PhotoBloc>().add(FetchPhotos(albumId));
    return Scaffold(
      appBar: AppBar(
        title: Text(albumTitle),
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFD700),
          ),
          onPressed: () {
            context.pop();
          },
          tooltip: 'Back to Album List',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        backgroundColor: const Color(0xFFFFD700),
        foregroundColor: Colors.black,
        tooltip: 'Back to Album List',
        child: const Icon(Icons.arrow_back),
      ),
      body: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          if (state is PhotoInitial || state is PhotoLoading) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFFFFD700)));
          } else if (state is PhotoLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: state.photos.length,
              itemBuilder: (context, index) {
                final photo = state.photos[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.network(
                          photo.thumbnailUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Icon(
                            Icons.error,
                            color: Color(0xFFFFD700),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          photo.title,
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is PhotoError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.message,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PhotoBloc>().add(FetchPhotos(albumId));
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}