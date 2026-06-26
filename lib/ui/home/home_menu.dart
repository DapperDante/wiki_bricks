import 'package:flutter/material.dart';
import 'package:wiki_bricks/core/services/models/theme.model.dart';
import 'package:wiki_bricks/ui/components/ui.components.dart';
import 'home_view_model.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key, required this.viewModel});
  final HomeViewModel viewModel;
  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  late Future<List<ThemeModel>> _themesFuture;
  @override
  initState() {
    super.initState();
    _themesFuture = widget.viewModel.getThemes();
  }

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
      FutureBuilder(
        future: _themesFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CarouselCustom(
              height: 100,
              list: snapshot.data!,
              builder: (context, i) => Container(
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  snapshot.data![i].name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    ],
  );
}
