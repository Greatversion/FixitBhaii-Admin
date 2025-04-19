import 'package:auto_route/auto_route.dart';
import 'package:fixitbhaii_admin/core/controller/auth_controller.dart';
import 'package:fixitbhaii_admin/routes/app.routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _login() async {
    final viewModel = context.read<LoginViewModel>();

    final user = await viewModel.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

     if (!mounted) return; 
    if (user != null) {

      context.router.replace(const DashboardRoute());
    } else {
      Fluttertoast.showToast(msg: "Login failed. Please try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text("Admin Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email')),
            TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 20),
            viewModel.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () => _login(),
                    child: const Text("Login"),
                  ),
          ],
        ),
      ),
    );
  }
}
