import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const Login());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Titulo")),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            const Text(
              "Login",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Expanded(child: SizedBox()),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // NOME
                  const SizedBox(
                    width: 200,
                    child: Expanded(
                      child: TextField(
                        decoration: InputDecoration(hintText: "NOME"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // SENHA
                  const SizedBox(
                    width: 200,
                    child: Expanded(
                      child: TextField(
                        decoration: InputDecoration(hintText: "SENHA"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: onPressed,
                    child: const Text("LOGAR"),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }

  void onPressed() {
    print("pressed button");
  }
}
