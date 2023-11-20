import 'package:flutter/material.dart';
import 'package:futbol_app/providers/teams_provider.dart';
import 'package:futbol_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final leaguesProvider = Provider.of<TeamsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fútbol'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Targetes principals de les 5 grans lligues
              CardSwiper(leagues: leaguesProvider.ondisplayLeagues),

              // Slider dels equips de la lliga seleccionada
              TeamsSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
