import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 8),
              const Text("Login", textScaleFactor: 3),
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
      ),
    );
  }

  void onPressed() {
    print("pressed button");
  }
}
