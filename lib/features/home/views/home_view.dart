import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_bricks/features/components/ui.components.dart';
import 'package:wiki_bricks/features/home/cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) => Column(
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
            return CarouselCustom(
              height: 100,
              list: state.themes,
              builder: (context, i) => Container(
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  state.themes[i].name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }
          if (state is HomeError) {
            return Text('Error: ${state.message}');
          }
          return CircularProgressIndicator();
        },
      ),
    ],
  );
}
