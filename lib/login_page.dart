import 'package:cng_filling_station/home_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
              color: const Color(0xFF00A36C),
              child: Center(
                  child: Text('CNGify',
                      style:
                          const TextStyle(fontSize: 70.0, color: Colors.white),
                      textAlign: TextAlign.center))),
        ),
        Expanded(
          child: Center(
            child: SizedBox(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text('Log In',
                          style: const TextStyle(fontSize: 50.0),
                          textAlign: TextAlign.center)),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                  TextFormField(
                    obscureText: isObsecure,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            isObsecure = !isObsecure;
                            setState(() {});
                          },
                          icon: Icon(isObsecure
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      border: UnderlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        )),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(250.0, 50.0),
                        backgroundColor: const Color(0xFF00A36C)),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
