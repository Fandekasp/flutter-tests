import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Debug packages
//import 'package:flutter/services.dart';
//import 'package:flutter/rendering.dart';
import 'package:grablunch/list.dart' show ListScreen;
import 'package:grablunch/chat.dart' show ChatScreen;
import 'package:grablunch/localization.dart'
    show AppLocalizations, AppLocalizationsDelegate;

void main() {
  //debugPaintSizeEnabled=true;
  runApp(new GrabLunchApp());
}

class GrabLunchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).title,
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? kIOSTheme
          : kDefaultTheme,
      home: new ListScreen(),
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('ja', 'JP'),
      ],
      routes: <String, WidgetBuilder>{
        '/chat': (BuildContext context) => new ChatScreen(),
      },
    );
  }
}

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  accentColor: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.purple,
);
