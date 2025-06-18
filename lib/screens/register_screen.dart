import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void _register(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mật khẩu không khớp')),
      );
      return;
    }

    // TODO: Gọi API đăng ký
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Đăng ký thành công')),
    );
    Navigator.pop(context); // Quay lại trang đăng nhập
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Đăng ký')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Mật khẩu'),
              obscureText: true,
            ),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(labelText: 'Nhập lại mật khẩu'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _register(context),
              child: Text('Đăng ký'),
            ),
          ],
        ),
      ),
    );
  }
}
