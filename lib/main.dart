import 'storage/hive_service.dart';
import 'network/api_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  ApiClient.instance.init();
  await HiveService.init();
  runApp(const App());
}
