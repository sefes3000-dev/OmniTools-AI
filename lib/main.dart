import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'core/constants/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/services/hive_service.dart';
import 'core/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Lock Orientation to Portrait by default
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize Local Hive Storage
  await Hive.initFlutter();
  await HiveService.init();

  // Initialize Ads SDK
  await MobileAds.instance.initialize();

  // Initialize Notification Engine
  await NotificationService().init();

  runApp(
    const ProviderScope(
      child: OmniToolsApp(),
    ),
  );
}

class OmniToolsApp extends ConsumerWidget {
  const OmniToolsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'OmniTools AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
