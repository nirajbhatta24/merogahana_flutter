import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mero_gahana/app/snackbar.dart';
import 'package:mero_gahana/repository/user_repo.dart';
import 'package:mero_gahana/screens/buttomscreen/dashboard.dart';
import 'package:mero_gahana/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String route = "loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _checkNotificationEnabled() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'booom');
  final _passwordController = TextEditingController(text: 'password');

  @override
  void initState() {
    _checkNotificationEnabled();
    super.initState();
    _initializeNotifications();
  }

  _initializeNotifications() async {
    AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Notification for basic use',
        defaultColor: const Color.fromARGB(255, 255, 200, 36),
        importance: NotificationImportance.Max,
        ledColor: const Color.fromARGB(255, 255, 0, 0),
        channelShowBadge: true,
      ),
    ]);
  }

  _login() async {
    final islogin = await UserRepositoryImpl()
        .loginUser(_usernameController.text, _passwordController.text);
    if (islogin) {
      
      _goToAnotherPage();
      _showNotification();
      
    } else {
      _showMessage();
    }
  }
  _showNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'basic_channel',
          title: 'Welcome to Mero Gahana ',
          body: 'Your Device is Logged in Phone.'),
    );
  }

  _goToAnotherPage() {
    Navigator.pushReplacementNamed(context, DashboardScreen.route);
  }

  _showMessage() {
    showSnackbar(context, 'Invalid username or password', Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/logo.svg',
                      height: 250,
                      width: 350,
                    ),
                    const SizedBox(height: 8),
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
                      key:const Key('txtUsername'),

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
        
                        labelText: 'Password',
                      ),
                      key:const Key('txtPassword'),

                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      key:const Key('btnLogin'),

                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _login();
                        }
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Brand Bold",
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),
                    ElevatedButton(

                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.route);
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Brand Bold",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
