import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/movies.dart';

class CardSwiperWidget extends StatelessWidget {
  const CardSwiperWidget({Key? key, required this.movies}) : super(key: key);
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: movies.length == 0
          ? Transform.scale(
              scale: 0.1,
              child: const CircularProgressIndicator(),
            )
          : Swiper(
              itemCount: movies.length,
              layout: SwiperLayout.STACK,
              itemHeight: size.height * 0.4,
              itemWidth: size.width * 0.6,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'details'),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                        placeholder: const AssetImage(
                          "assets/no-image.jpg",
                        ),
                        image: NetworkImage(movie.fullPosterImage),
                        fit: BoxFit.cover),
                  ),
                );
              },
            ),
    );
  }
}
