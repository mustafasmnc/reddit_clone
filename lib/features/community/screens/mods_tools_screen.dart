import 'package:flutter/material.dart';
import 'package:reddit_clone/responsive/responsive.dart';
import 'package:routemaster/routemaster.dart';

class ModsToolsScreen extends StatelessWidget {
  final String name;
  const ModsToolsScreen({Key? key, required this.name}) : super(key: key);

  void navigateToEditCommunity(BuildContext context) {
    Routemaster.of(context).push('/edit-community/$name');
  }

  void navigateToAddMods(BuildContext context) {
    Routemaster.of(context).push('/add-mods/$name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mod Tools')),
      body: Responsive(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.add_moderator),
              title: const Text('Add Moderators'),
              onTap: () => navigateToAddMods(context),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Community'),
              onTap: () => navigateToEditCommunity(context),
            )
          ],
        ),
      ),
    );
  }
}
