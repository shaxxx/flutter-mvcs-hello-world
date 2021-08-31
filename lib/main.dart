import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'commands/base_command.dart' as Commands;
import 'models/app_model.dart';
import 'views/home_page.dart';
import 'views/login_page.dart';

void main() => runApp(
      ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Save a reader our Commands can use to access provided Models and Services
    Commands.init(ref.read);
    return MaterialApp(home: AppScaffold());
  }
}

class AppScaffold extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Bind to AppModel.currentUser
    final String currentUser = ref
        .watch(Commands.appModelProvider.select((model) => model.currentUser));
    // Return the current view, based on the currentUser value:
    return Scaffold(
      body: currentUser != null ? HomePage() : LoginPage(),
    );
  }
}
