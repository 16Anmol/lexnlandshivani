import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_options.dart';
import 'customer/theme/app_theme.dart';
import 'auth/splash_flow.dart';

// Web (client_type 3) OAuth client ID from google-services.json.
const String _kServerClientId =
    '756869712541-mcvumiqt63ii76s60m21690gm4ena89s.apps.googleusercontent.com';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // google_sign_in 7.x must be initialised once, before any authenticate().
  // serverClientId is needed on Android; on web it is not used.
  await GoogleSignIn.instance.initialize(
    serverClientId: kIsWeb ? null : _kServerClientId,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const LexNLandApp());
}

class LexNLandApp extends StatelessWidget {
  const LexNLandApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LexNLand',
      debugShowCheckedModeBanner: false,
      theme: customerTheme(), // one maroon theme for the whole app
      home: const SplashScreen(),
    );
  }
}
