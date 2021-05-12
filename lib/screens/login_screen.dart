import 'package:ecopouce_screens/helpers/app_localizations.dart';
import 'package:ecopouce_screens/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();

  String email = "";

  bool _isLoading = false;
  bool _isErrorAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login"),
      // ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Form(
                  key: _form,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                          child: Center(
                            child: Container(
                                width: 200,
                                height: 150,
                                child: Image.asset(
                                    'assets/images/eco_pouce_rvb.png')),
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)
                              .translate('login_string'),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _isErrorAccount
                            ? Column(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)
                                        .translate('login_error_string'),
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            // autofocus: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: AppLocalizations.of(context)
                                  .translate('email_address_string'),
                              hintText: AppLocalizations.of(context)
                                  .translate('hint_email_string'),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) => email = value,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            // autofocus: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: AppLocalizations.of(context)
                                  .translate('password_string'),
                              hintText: AppLocalizations.of(context)
                                  .translate('hint_password_string'),
                            ),
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          child: Text(
                            AppLocalizations.of(context)
                                .translate('login_submit_string'),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(HomeScreen.routeName);
                          },
                        ),
                        FlatButton(
                          child: Text(
                            AppLocalizations.of(context)
                                .translate('sign_in_string'),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
