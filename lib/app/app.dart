import 'localization/locale_state.dart';
import 'localization/locale_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'theme/theme_state.dart';
import 'theme/theme_cubit.dart';
import 'theme/app_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocaleCubit()..loadLocale()),
        BlocProvider(create: (_) => ThemeCubit()..loadTheme()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'My App',
            debugShowCheckedModeBanner: false,
            locale: localeState.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeState.themeMode,
            theme: ThemeData(useMaterial3: true),
            home: const Scaffold(body: Center(child: Text('Flutter App'))),
          );
        },
      ),
    );
  }
}
