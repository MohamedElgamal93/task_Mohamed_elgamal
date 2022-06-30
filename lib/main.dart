import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskproject/constthemedata.dart';
import 'package:taskproject/util/applocalizations.dart';
import 'package:taskproject/util/route.dart';
import 'package:taskproject/util/strings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bussniess_logic/localization_cubit/localization_cubit.dart';

void main() async {
  runApp(const ConfigApp());
}

class ConfigApp extends StatefulWidget {
  const ConfigApp({Key? key}) : super(key: key);

  @override
  State<ConfigApp> createState() => _ConfigAppState();
}

class _ConfigAppState extends State<ConfigApp> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
    
    MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LocalizationCubit()..getLocale()),
         
        ],
        child: BlocBuilder<LocalizationCubit, LocalizationState>(
          builder: (context, state) {
            return 
    MaterialApp(
        localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              ],
              locale: state.mainLocale,
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocaleLanguage in supportedLocales) {
                  if (supportedLocaleLanguage.languageCode ==
                          locale!.languageCode &&
                      supportedLocaleLanguage.countryCode ==
                          locale.countryCode) {
                    return supportedLocaleLanguage;
                  }
                }
                return supportedLocales.first;
              },
              supportedLocales: const [
                Locale('ar', ''), // Arabic, no country code
                Locale('en', ''), // English, no country code
              ],
      title: 'taskproject',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      onGenerateRoute: AppRouter().generateRoute,
      initialRoute: homePage,
    );
  }));
        


  }} 