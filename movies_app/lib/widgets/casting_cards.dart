import 'package:flutter/material.dart';

class CastingCardsWidget extends StatelessWidget {
  const CastingCardsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (_, int index) => _ActorPoster()),
    );
  }
}

class _ActorPoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage('https://via.placeholder.com/300x400')),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'aactor.name jshyshshbd',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
