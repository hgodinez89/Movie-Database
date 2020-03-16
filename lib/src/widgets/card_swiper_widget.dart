import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {

  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {

    // mediaquery da informacion de la pantalla

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          itemBuilder: (BuildContext context, int index){

            peliculas[index].uniqueId = '${peliculas[index].id}-tarjeta';

            return Hero(
              tag: peliculas[index].uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'detalle', arguments: peliculas[index]),
                  child: FadeInImage(
                    image: NetworkImage(peliculas[index].getPosterImg()),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(milliseconds: 200),
                    fadeInCurve: Curves.easeInOut,
                  ),
                )
              ),
            );
          },
          itemCount: peliculas.length,
          layout: SwiperLayout.STACK
          // pagination elimina los puntos debajo de las imagenes
          // pagination: new SwiperPagination(),
          // control elimina las flechas a los lados de las imagenes
          // control: new SwiperControl(),
        ),
    );

  }
}