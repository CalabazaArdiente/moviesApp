import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class CardSliderWidget extends StatelessWidget {
  const CardSliderWidget({Key? key, required this.movies, this.title})
      : super(key: key);
  final List<Movie> movies;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title != null
                ? Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Container(),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (_, int index) {
                    final movie = movies[index];
                    return _MoviePoster(
                      movie: movie,
                    );
                  }),
            ),
          ]),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  fit: BoxFit.cover,
                  width: 110,
                  height: 150,
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImage)),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
