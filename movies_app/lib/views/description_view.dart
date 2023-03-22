import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';

class DescriptionView extends StatelessWidget {
  const DescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO cambiaar por instancia de movie

    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate(
                  [_PosterTitle(), _OverView(), CastingCardsWidget()]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text('movie.title'),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'),
          image: AssetImage('assets/loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterTitle extends StatelessWidget {
  const _PosterTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final textTehme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage('https://via.placeholder.com/200x300'),
            height: 200,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'movie.title',
              style: textTehme.headline5,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Titulo original',
              style: textTehme.subtitle1,
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
            Row(
              children: [
                Icon(
                  Icons.star_border_outlined,
                  color: Colors.amber,
                  size: 15,
                ),
                Text(
                  'Calificación del público',
                  style: textTehme.caption,
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}

class _OverView extends StatelessWidget {
  const _OverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text(
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.subtitle1,
          'Voluptate proident excepteur nulla quis qui veniam nulla labore minim eu et. Veniam reprehenderit labore aute excepteur non enim ullamco id commodo enim. Fugiat eiusmod cillum exercitation ut ullamco in sit quis eiusmod non. Excepteur deserunt cillum ut Lorem et est et sit.Velit culpa dolor labore eiusmod aliqua aliquip. Nostrud nisi in consequat culpa et cillum ullamco aliquip deserunt enim ut ipsum Lorem officia. Ea elit nisi occaecat commodo veniam ad id labore. Nostrud pariatur minim aute ullamco laborum reprehenderit nostrud laboris magna quis incididunt reprehenderit. Consequat ad laboris ea esse commodo commodo consequat nisi et eu sunt.Irure irure irure eu eiusmod reprehenderit. Reprehenderit nulla esse sit amet adipisicing pariatur aute ex aliqua adipisicing quis est irure consectetur. Deserunt elit ad ex laborum non labore ullamco tempor Lorem eiusmod proident. Nisi anim ea dolore ut velit qui esse excepteur adipisicing officia. Excepteur exercitation esse ad tempor cupidatat incididunt voluptate commodo occaecat qui. Aute culpa anim nulla veniam ut nisi aliqua sint velit enim in. Consectetur amet laborum laborum reprehenderit laboris aliqua eu.'),
    );
  }
}
