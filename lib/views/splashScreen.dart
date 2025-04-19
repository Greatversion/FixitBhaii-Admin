import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixitbhaii_admin/core/services/auth_service.dart';
import 'package:fixitbhaii_admin/routes/app.routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:fixitbhaii_admin/views/auth/login_screen.dart';
import 'package:fixitbhaii_admin/views/dashboard/dashboard_screen.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    final isAdmin = await _authService.isAdmin();

    if (!mounted) return; // Prevent navigation if widget is unmounted

    if (isAdmin) {
      context.router.replace(const DashboardRoute());
    } else {
      context.router.replace(const LoginRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
