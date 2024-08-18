import 'package:flutter_localizations/flutter_localizations.dart';

import '../generated/index.dart';
import '../packages/index.dart';
import 'routes.dart';

class MainApplication extends StatefulWidget {
  const MainApplication({super.key});

  @override
  State<MainApplication> createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      themeMode: ThemeMode.light,
      theme: AppTheme.buildLightTheme(),
      darkTheme: AppTheme.buildDarkTheme(),
      builder: YDToast.builder(),
      localizationsDelegates: const [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: AppLocale.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}
