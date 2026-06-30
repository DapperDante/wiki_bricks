import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this._widget});
  final Widget _widget;
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(10),
    ),
    child: _widget
  );
}

class CarouselCustom<T> extends StatelessWidget {
  const CarouselCustom({
    super.key,
    required this._list,
    required this._builder,
    required this.height,
  });
  final List<T> _list;
  final Widget Function(BuildContext, int) _builder;
  final double height;

  @override
  Widget build(BuildContext context) => CarouselSlider.builder(
    itemCount: _list.length,
    itemBuilder: (context, i, page) => _builder(context, i),
    options: CarouselOptions(
      // autoPlay: true,
      enableInfiniteScroll: false,
      pageSnapping: true,
      enlargeCenterPage: true,
      viewportFraction: 0.8,
      height: height,

    ),
  );
}