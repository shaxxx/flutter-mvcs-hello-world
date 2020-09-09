
// The commands will use this to access the Provided models and services.
// This is just an example, you can store this anywhere you like, or do something like Commands.init(BuildContext)
import 'package:flutter/material.dart';
import 'package:mvcs_blogpost/models/app_model.dart';
import 'package:mvcs_blogpost/models/user_model.dart';
import 'package:mvcs_blogpost/services/user_service.dart';
import 'package:provider/provider.dart';

BuildContext _mainContext;

void init(BuildContext c) => _mainContext = c;

// Provide quick lookup methods for all the top-level models and services. Keeps the Command code slightly cleaner.
class BaseCommand {
  // Models
  UserModel userModel = _mainContext.read();
  AppModel appModel = _mainContext.read();
  // Services
  UserService userService = _mainContext.read();
}


