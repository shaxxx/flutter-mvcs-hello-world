import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvcs_blogpost/commands/base_command.dart';

import '../commands/refresh_posts_command.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool _isLoading = false;

  void _handleRefreshPressed() async {
    // Disable the RefreshBtn while the Command is running
    setState(() => _isLoading = true);
    // Run command
    await RefreshPostsCommand().run(ref.read(appModelProvider).currentUser);
    // Re-enable refresh btn when command is done
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    // Bind to UserModel.userPosts
    var users = ref.watch(userModelProvider.select((model) => model.userPosts));
    // Disable btn by removing listener when we're loading.
    VoidCallback btnHandler = _isLoading ? null : _handleRefreshPressed;
    // Render list of widgets
    var listWidgets = users.map((post) => Text(post)).toList();
    return Scaffold(
      body: Column(
        children: [
          Flexible(child: ListView(children: listWidgets)),
          FlatButton(child: Text("REFRESH"), onPressed: btnHandler),
        ],
      ),
    );
  }
}
