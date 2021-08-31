import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvcs_blogpost/models/app_model.dart';
import 'package:mvcs_blogpost/models/user_model.dart';
import 'package:mvcs_blogpost/services/user_service.dart';

final userModelProvider =
    ChangeNotifierProvider<UserModel>((ref) => UserModel());
final appModelProvider = ChangeNotifierProvider((ref) => AppModel());
final userServiceProvider = Provider((ref) => UserService());

Reader _read;
void init(Reader read) => _read = read;

// Provide quick lookup methods for all the top-level models and services.
// Keeps the Command code slightly cleaner.
class BaseCommand {
  UserModel get userModel => _read(userModelProvider);
  AppModel get appModel => _read(appModelProvider);
  UserService get userService => _read(userServiceProvider);
}
