import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_app/Widget/change_theme_button_widget.dart';
import 'package:movies_app/Widget/language_picker_widget.dart';
import 'package:movies_app/l10n/gen_l10n/app_localizations.dart';
import 'package:movies_app/l10n/l10n.dart';
import 'package:movies_app/l10n/language_provider.dart';
import 'package:provider/provider.dart';
import 'Theme/AppTheme.dart';

void main() {
  runApp(
    // MyApp()
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LanguageProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).darkTheme
          ? MyTheme.darkTheme
          : MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      locale: Provider.of<LanguageProvider>(context).locale,
      supportedLocales: L10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Movies'),
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              AppLocalizations.of(context)!.language,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(child: LanguagePickerWidget()),
        ],
      ),
    );
  }
}
