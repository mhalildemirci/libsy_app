import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PassRenewalScreen extends StatefulWidget {
  const PassRenewalScreen({Key? key});

  @override
  State<PassRenewalScreen> createState() => _PassRenewalScreenState();
}

class _PassRenewalScreenState extends State<PassRenewalScreen> {
  final TextEditingController emailController = TextEditingController();
  bool showErrorBorderEmail = false;

  Future<void> _resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      // Şifre sıfırlama e-postası gönderildi
    } catch (e) {
      print("Hata: $e");
      setState(() {
        showErrorBorderEmail = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover)),
          child: ListView(children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: showErrorBorderEmail
                                    ? Colors.red
                                    : Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: showErrorBorderEmail
                                    ? Colors.red
                                    : Colors.white),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {
                            showErrorBorderEmail = false;
                          });
                        },
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: _resetPassword,
                        child: Text(
                          'Reset Pass',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ]))
          ])),
    );
  }
}
