import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<League> leagues;

  const CardSwiper({Key? key, required this.leagues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (leagues.isEmpty) {
      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
        width: double.infinity,
        // Aquest multiplicador estableix el tant per cent de pantalla ocupada 50%
        height: size.height * 0.5,
        child: Swiper(
          itemCount: leagues.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (BuildContext context, int index) {
            final league = leagues[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: 'detalls peli'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(league.imageUrl),
                    fit: BoxFit.cover),
              ),
            );
          },
        ));
  }
}
