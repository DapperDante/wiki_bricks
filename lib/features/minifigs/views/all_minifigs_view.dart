import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/minifigs_cubit.dart';

class AllMinifigsView extends StatelessWidget {
  const AllMinifigsView({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MinifigsCubit, MinifigsState>(
        builder: (context, state) {
          if (state is MinifigsLoaded) {
            return ListView.builder(
              itemCount: state.minifigs.length,
              itemBuilder: (context, index) {
                final minifig = state.minifigs[index];
                return ListTile(
                  title: Text(minifig.name),
                  subtitle: Text('ID: ${minifig.name}'),
                );
              },
            );
          }
          if (state is MinifigsError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return CircularProgressIndicator();
        },
      );
}
