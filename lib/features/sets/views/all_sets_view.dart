import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_bricks/features/sets/cubit/sets_cubit.dart';

class AllSetsView extends StatelessWidget {
  const AllSetsView({super.key});

  @override
  Widget build(BuildContext context) => 
  BlocBuilder<SetsCubit, SetsState>(
    builder: (context, state) {
      if (state is SetsLoaded) {
        return ListView.builder(
          itemCount: state.sets.length,
          itemBuilder: (context, index) {
            final set = state.sets[index];
            return ListTile(
              title: Text(set.name),
              subtitle: Text('ID: ${set.name}'),
            );
          },
        );
      }
      if (state is SetsError) {
        return Center(child: Text('Error: ${state.message}'));
      }
      return CircularProgressIndicator();
    },
  );
}
