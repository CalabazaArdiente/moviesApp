import 'package:flutter/material.dart';
import 'package:movies_app/providers/providers.dart';
import 'package:movies_app/views/views.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoviesApp :)',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeView(),
        'details': (_) => const DescriptionView()
      },
    );
  }
}
