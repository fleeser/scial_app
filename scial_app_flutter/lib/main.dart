import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scial_app_flutter/src/app.dart';
import 'package:scial_app_flutter/src/services/auth_key_manager.dart';
import 'package:scial_app_flutter/src/services/key_value_storage.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

late Client client;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  await dotenv.load(fileName: '.env');

  await Hive.initFlutter();
  await KeyValueStorage.openAuthBox();
  await KeyValueStorage.openThemeBox();
  await KeyValueStorage.openLocalizationBox();

  client = Client(
    dotenv.env['SERVER_URL']!,
    authenticationKeyManager: AuthKeyManager()
  )..connectivityMonitor = FlutterConnectivityMonitor();

  // await client.openStreamingConnection(disconnectOnLostInternetConnection: false);

  runApp(const ProviderScope(child: App()));
}