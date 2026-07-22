import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home_screen.dart';
import '../../features/tools/presentation/password_generator_screen.dart';
import '../../features/tools/presentation/hash_generator_screen.dart';
import '../../features/tools/presentation/qr_generator_screen.dart';
import '../../features/tools/presentation/base64_screen.dart';
import '../../features/tools/presentation/bmi_calculator_screen.dart';
import '../../features/tools/presentation/unit_converter_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/password-generator',
        builder: (context, state) => const PasswordGeneratorScreen(),
      ),
      GoRoute(
        path: '/hash-generator',
        builder: (context, state) => const HashGeneratorScreen(),
      ),
      GoRoute(
        path: '/qr-generator',
        builder: (context, state) => const QrGeneratorScreen(),
      ),
      GoRoute(
        path: '/base64',
        builder: (context, state) => const Base64Screen(),
      ),
      GoRoute(
        path: '/bmi-calculator',
        builder: (context, state) => const BmiCalculatorScreen(),
      ),
      GoRoute(
        path: '/unit-converter',
        builder: (context, state) => const UnitConverterScreen(),
      ),
    ],
  );
});
      GoRoute(
        path: '/text-counter',
        builder: (context, state) => const TextCounterScreen(),
      ),
      GoRoute(
        path: '/case-converter',
        builder: (context, state) => const CaseConverterScreen(),
      ),
      GoRoute(
        path: '/json-formatter',
        builder: (context, state) => const JsonFormatterScreen(),
      ),
      GoRoute(
        path: '/uuid-generator',
        builder: (context, state) => const UuidGeneratorScreen(),
      ),
      GoRoute(
        path: '/device-info',
        builder: (context, state) => const DeviceInfoScreen(),
      ),
      GoRoute(
        path: '/battery-info',
        builder: (context, state) => const BatteryInfoScreen(),
      ),
      GoRoute(
        path: '/flashlight',
        builder: (context, state) => const FlashlightScreen(),
      ),
      GoRoute(
        path: '/compass',
        builder: (context, state) => const CompassScreen(),
      ),
      GoRoute(
        path: '/ocr',
        builder: (context, state) => const OcrScreen(),
      ),
      GoRoute(
        path: '/image-compressor',
        builder: (context, state) => const ImageCompressorScreen(),
      ),
      GoRoute(
        path: '/image-resizer',
        builder: (context, state) => const ImageResizerScreen(),
      ),
