import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_bricks/features/sets/models/set.model.dart';

import '../../minifigs/models/minifig.model.dart';
import '../../themes/models/theme.model.dart';
import '../../../core/widgets/view.widget.dart';
import '../cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      spacing: 15,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return _ViewLoaded(
                themes: state.themes,
                minifigs: state.minifigs,
                sets: state.sets,
              );
            }
            if (state is HomeError) {
              return Text('Error: ${state.message}');
            }
            return CircularProgressIndicator();
          },
        ),
      ],
    ),
  );
}

class _ViewLoaded extends StatelessWidget {
  final List<ThemeModel> themes;
  final List<MinifigModel> minifigs;
  final List<SetModel> sets;
  const _ViewLoaded({required this.themes, required this.minifigs, required this.sets});
  @override
  Widget build(BuildContext context) => Column(
    spacing: 15,
    children: [
      CarouselCustom(
        height: 100,
        list: themes,
        builder: (context, i) => Container(
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            themes[i].name,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      // for (var minifig in minifigs) CardWidget(widget: Text(minifig.name)),
      CardWidget(
        widget: Text('View All Minifigs', textAlign: TextAlign.center),
      ),
      GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        children: List.generate(
          minifigs.length,
          (i) => CardWidget(
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                SizedBox(
                  height: 100,
                  child: CachedNetworkImage(
                    imageUrl: minifigs[i].setImgUrl,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Text(minifigs[i].name, textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
      CardWidget(
        widget: Text('View All sets', textAlign: TextAlign.center),
      ),
      GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        children: List.generate(
          sets.length,
          (i) => CardWidget(
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                SizedBox(
                  height: 100,
                  child: CachedNetworkImage(
                    imageUrl: sets[i].setImgUrl ?? '',
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Text(sets[i].name, textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
