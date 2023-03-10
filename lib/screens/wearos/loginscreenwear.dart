
import 'package:flutter/material.dart';
import 'package:mero_gahana/app/snackbar.dart';
import 'package:mero_gahana/repository/user_repo.dart';
import 'package:wear/wear.dart';

class LoginScreenWear extends StatefulWidget {
  const LoginScreenWear({super.key});

  static const String route = "/wareoWOLoginScreen";


  @override
  State<LoginScreenWear> createState() => _LoginScreenWearState();
}

class _LoginScreenWearState extends State<LoginScreenWear> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  _login() async {
    final islogin = await UserRepositoryImpl()
        .loginUser(_usernameController.text, _passwordController.text);
    if (islogin) {
      _goToAnotherPage();
    } else {
      _showMessage();
    }
  }

  _goToAnotherPage() {
    Navigator.pushNamed(context, '/dashboardScreen');
  }

  _showMessage() {
    showSnackbar(context, 'Invalid username or password', Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return  WatchShape(builder: (BuildContext context, WearShape shape, Widget? child) {
      return AmbientMode(builder: (context, mode, child){
        return   Scaffold(
            body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const SizedBox(height: 0),
                    TextFormField(
                      controller: _usernameController,
                      onSaved: (newValue) {
                        setState(() {
                          _usernameController.text = newValue!;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
        
                        labelText: 'Password',
                      ),
                      key:const Key('txtpassword'),

                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _login();
                        }
                      },
                      child: const SizedBox(
                        height: 20,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Brand Bold",
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

        );

      });
      
    },);
  }
}