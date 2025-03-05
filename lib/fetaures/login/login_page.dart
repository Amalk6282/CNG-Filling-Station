import 'package:cng_filling_station/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../common_widgets.dart/custom_alert_dialog.dart';
import '../../common_widgets.dart/custom_button.dart';
import '../../common_widgets.dart/custom_text_formfield.dart';
import '../../theme/app_theme.dart';
import '../../util/value_validator.dart';
import 'login_bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          milliseconds: 100,
        ), () {
      User? currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false,
              );
            } else if (state is LoginFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failed',
                  description: state.message,
                  primaryButton: 'Ok',
                ),
              );
            }
          },
          builder: (context, state) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Left side - CNG station image
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          primaryColor,
                          Colors.green.withOpacity(0.6),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'CNGify',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 52,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                // Right side - Login form
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Container(
                      width: 400,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Log In',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 40),
                              CustomTextFormField(
                                isLoading: state is LoginLoadingState,
                                controller: _emailController,
                                labelText: 'Email',
                                prefixIconData: Icons.email,
                                validator: emailValidator,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: isObscure,
                                validator: passwordValidator,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      isObscure = !isObscure;
                                      setState(() {});
                                    },
                                    icon: Icon(isObscure
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock),
                                ),
                              ),
                              SizedBox(height: 12),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                      color: Color(0xFF00A67E),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              CustomButton(
                                inverse: true,
                                isLoading: state is LoginLoadingState,
                                label: 'Login',
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    BlocProvider.of<LoginBloc>(context).add(
                                      LoginEvent(
                                        email: _emailController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
                                      ),
                                    );
                                  }
                                },
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
