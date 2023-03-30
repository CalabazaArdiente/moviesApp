import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class CardSliderWidget extends StatefulWidget {
  const CardSliderWidget(
      {Key? key, required this.movies, this.title, required this.onNextOage})
      : super(key: key);
  final List<Movie> movies;
  final String? title;
  final Function onNextOage;

  @override
  State<CardSliderWidget> createState() => _CardSliderWidgetState();
}

class _CardSliderWidgetState extends State<CardSliderWidget> {
  bool _canGetMore = true;
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      final double diff = scrollController.position.maxScrollExtent -
          scrollController.position.pixels;
      if (diff <= 500) {
        if (_canGetMore) {
          _canGetMore = false;
          widget.onNextOage();
        } else {
          _canGetMore = true;
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.title != null
                ? Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      widget.title!,
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
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.movies.length,
                  itemBuilder: (_, int index) {
                    final movie = widget.movies[index];
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
