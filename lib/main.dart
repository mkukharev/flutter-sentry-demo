import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:receptioner_monitoring/features/login/login_page.dart';
import 'package:receptioner_monitoring/generic/state/loading_change_notifier.dart';
import 'package:receptioner_monitoring/storage/storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  runZonedGuarded(() async {
    await LocalStorage.initData();
    await dotenv.load();
    var appProviderWrapper = const ReceptionerAppProviderWrapper();
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://${dotenv.env['SENTRY_PROJECT_KEY']!}@o4506215799259136.ingest.sentry.io/${dotenv.env['SENTRY_PROJECT_SUFFIX']!}';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
        options.attachScreenshot = true;
        options.screenshotQuality = SentryScreenshotQuality.low;
        options.sampleRate = 1.0;
        options.release = 'receptioner_monitoring@2.0.0';
        options.environment = 'production';
        options.dist = 'rprod';
      },
    );
    runApp(
      SentryScreenshotWidget(
        child: appProviderWrapper,
      ),
    );
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}

class ReceptionerAppProviderWrapper extends StatelessWidget {
  const ReceptionerAppProviderWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoadingModel(),
      child: const ReceptionerApp(),
    );
  }
}

class ReceptionerApp extends StatelessWidget {
  const ReceptionerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sentry Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
