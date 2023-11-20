import 'package:flutter/material.dart';
import 'package:futbol_app/providers/teams_provider.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';

class TeamsSlider extends StatelessWidget {
  const TeamsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final teamsProvider = Provider.of<TeamsProvider>(context);
    final teams = teamsProvider.ondisplayTeams;

    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Equipos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: teams.isEmpty
                ? _buildPlaceholder()
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: teams.length,
                    itemBuilder: (_, int index) {
                      final team = teams[index];
                      return _TeamPoster(team: team);
                    }),
          )
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/300x400'),
              width: 130,
              height: 190,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Selecciona una liga',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _TeamPoster extends StatelessWidget {
  final Team team;

  const _TeamPoster({Key? key, required this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'detalls team'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(team.strTeamBadge),
                width: 130,
                height: 190,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            team.strTeam,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
