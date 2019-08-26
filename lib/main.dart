import 'package:flutter/material.dart';
import 'package:what_not_to_miss/wntm_splashscreen.dart';
import 'package:catcher/catcher_plugin.dart';

import 'wntm_splashscreen.dart';

void main(){
  CatcherOptions debugOptions =
      CatcherOptions(DialogReportMode(), [ConsoleHandler()]);
  CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
    EmailManualHandler(["recipient@email.com"])
  ]);
  
  Catcher(
    new MaterialApp(
    navigatorKey: Catcher.navigatorKey,
    theme: ThemeData(
      primarySwatch: Colors.red
    ),
    home: new WNTMSplashScreen(),
  )
  , debugConfig: debugOptions, releaseConfig: releaseOptions);

}




