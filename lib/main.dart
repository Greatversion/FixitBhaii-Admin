import 'package:firebase_core/firebase_core.dart';
import 'package:fixitbhaii_admin/core/controller/auth_controller.dart';
import 'package:fixitbhaii_admin/core/services/auth_service.dart';
import 'package:fixitbhaii_admin/firebase_options.dart';
import 'package:fixitbhaii_admin/routes/app.routes.dart';
import 'package:fixitbhaii_admin/themes/app.dimensions.dart';
import 'package:fixitbhaii_admin/themes/app.theme.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';
// import 'package:fixitbhaii_admin/views/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      builder: (context) => FixitBhaiiAdmin(),
    ),
  );
  //  runApp(
  //   FixitBhaiiAdmin(),
  // );
}

class FixitBhaiiAdmin extends StatelessWidget {
  const FixitBhaiiAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    
    final AppRouter appRouter = AppRouter();
    Dimensions.init(context); // Initialize dimensions here
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel(AuthService())),
      ],
      child: MaterialApp.router(
        
        routerConfig: appRouter.config(),
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        debugShowCheckedModeBanner: false,
        title: 'FixitBhaii Admin',
        themeMode: ThemeMode.system,
      ),
    );
  }
}
