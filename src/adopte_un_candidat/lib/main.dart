import 'package:adopte_un_candidat/firebase_options.dart';
import 'package:adopte_un_candidat/modules/database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Database database = Database();
  Future<List?> cardStack = database.getStack();
  
  try {
    // Await the future to complete and get the actual list
    List<dynamic>? stackContents = await cardStack;

    if (kDebugMode) {
      print("cardstack: ${stackContents?[0]["proposal"]}");
    }
  } catch (e) {
    if (kDebugMode) {
      print("Error: $e");
    }
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}