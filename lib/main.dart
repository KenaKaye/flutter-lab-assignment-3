import 'package:albumfetch/presentation/blocs/album/album_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/services/api_service.dart';
import 'presentation/blocs/album/album_bloc.dart';
import 'presentation/blocs/photo/photo_bloc.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AlbumBloc(apiService)..add(FetchAlbums())),
        BlocProvider(create: (context) => PhotoBloc(apiService)),
      ],
      child: MaterialApp.router(
        title: 'Album Fetch',
        theme: ThemeData(
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.dark(
            primary: const Color(0xFFFFD700),
            secondary: const Color(0xFFFFB300),
            background: Colors.black,
            surface: Colors.grey[900]!,
            onPrimary: Colors.black,
            onBackground: Colors.white,
            onSurface: Colors.white,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFFD700),
            foregroundColor: Colors.black,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white70),
            headlineSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFD700),
              foregroundColor: Colors.black,
            ),
          ),
          cardTheme: CardTheme(
            color: Colors.grey[900],
            elevation: 4.0,
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}