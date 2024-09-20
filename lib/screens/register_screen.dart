import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _register() async {
    try {
      // Đăng ký người dùng
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (mounted) {
        showCustomSnackBar(
            context, 'Đăng ký thành công! Vui lòng đăng nhập.', Colors.green);
        Navigator.pop(
            context); // Quay lại màn hình đăng nhập sau khi đăng ký thành công
      }
    } catch (e) {
      // Hiển thị thông báo lỗi đăng ký
      if (mounted) {
        showCustomSnackBar(context, 'Đăng ký không thành công', Colors.red);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng Ký')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration:const InputDecoration(
                hintText: 'Mật khẩu',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _register,
              child: const Text('Đăng Ký'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Quay lại màn hình đăng nhập
              },
              child: const Text('Đã có tài khoản? Đăng nhập!'),
            ),
          ],
        ),
      ),
    );
  }
}
