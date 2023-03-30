import 'package:flutter/material.dart';
import 'package:movies_app/providers/providers.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Peliculas'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiperWidget(movies: moviesProvider.onDisplayMovies),
              CardSliderWidget(
                movies: moviesProvider.popularMovies,
                title: 'Las más vistas',
                onNextOage: () => moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        ));
  }
}
