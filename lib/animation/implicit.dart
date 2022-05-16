import 'package:animation/animation/explicit.dart';
import 'package:animation/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Implicit extends StatefulWidget {
  @override
  _ImplicitPageState createState() => _ImplicitPageState();
}

enum AuthMode { SignUp, Login }

class _ImplicitPageState extends State<Implicit> {
  double targetValue = 1.0;

  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  final _passwordController = TextEditingController();

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Implicit Animation',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //in-build
            Card(
              margin: EdgeInsets.all(20),
              elevation: 8,
              child: AnimatedContainer(
                curve: Curves.bounceInOut,
                duration: const Duration(seconds: 2),
                height: _authMode == AuthMode.SignUp ? 320 : 260,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: "E-Mail"),
                          keyboardType: TextInputType.emailAddress,
                          // validator: (val) {
                          //   if (val!.isEmpty || !val.contains('@')) {
                          //     return "Invalid email!";
                          //   }
                          //   return null;
                          // },
                          onSaved: (val) {
                            _authData['password'] = val!;
                            print(_authData['password']);
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Password"),
                          controller: _passwordController,
                          obscureText: true,
                          // validator: (val) {
                          //   if (val!.isEmpty || val.length <= 5) {
                          //     return "Password is too short!";
                          //   }
                          //   return null;
                          // },
                          onSaved: (val) {
                            _authData['email'] = val!;
                            print(_authData['email']);
                          },
                        ),
                        AnimatedContainer(
                          duration: Duration(seconds: 2),
                          constraints: BoxConstraints(
                            maxHeight: _authMode == AuthMode.SignUp ? 120 : 0,
                            minHeight: _authMode == AuthMode.SignUp ? 60 : 0,
                          ),
                          child: AnimatedOpacity(
                            duration: Duration(seconds: 1),
                            opacity: _authMode == AuthMode.SignUp ? 1 : 0,
                            child: TextFormField(
                              enabled: _authMode == AuthMode.SignUp,
                              decoration: InputDecoration(
                                  labelText: 'Confirm Password'),
                              obscureText: true,
                              validator: _authMode == AuthMode.SignUp
                                  ? (value) {
                                      if (value != _passwordController.text) {
                                        return 'Passwords do not match!';
                                      }
                                      return null;
                                    }
                                  : null,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        MaterialButton(
                          child: Text(_authMode == AuthMode.Login
                              ? 'LOGIN'
                              : 'SIGN UP'),
                          onPressed: _submit,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 8.0),
                          color: Theme.of(context).primaryColor,
                          textColor:
                              Theme.of(context).primaryTextTheme.button!.color,
                        ),
                        MaterialButton(
                          child: Text(
                              '${_authMode == AuthMode.Login ? 'SIGN UP' : 'LOGIN'} INSTEAD'),
                          onPressed: _switchAuthMode,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 4),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          textColor: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),

            //TweenBuilder
            InkWell(
              onTap: () => setState(() {
                targetValue = targetValue == 1.0 ? 200.0 : 1.0;
              }),
              child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.0, end: targetValue),
                  duration: const Duration(seconds: 1),
                  builder: (context, double size, Widget? child) => Container(
                        height: 100,
                        width: 100,
                        color: Color.fromRGBO(size.toInt(), 7, 3, 1),
                      )),
            ),
            SizedBox(
              height: 100,
            ),

            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(15),
              ),
              child: TextButton(
                onPressed: () {
                  Get.toNamed(Routes.explicitRoute);
                },
                child: Text('Explicit Animation Screen'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    if (_authMode == AuthMode.Login) {
      // Log user in
    } else {
      // Sign user up
    }
  }
}
