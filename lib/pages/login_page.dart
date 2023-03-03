
import 'package:batch5_contact_app/auth_prefs.dart';
import 'package:batch5_contact_app/pages/contact_list_page.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routename='/';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController= TextEditingController();
  final passwordController= TextEditingController();
  bool isObscure=true;

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email)
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: isObscure,
                decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                    icon: Icon(isObscure?Icons.visibility_off: Icons.visibility),
                    onPressed: (){
                      setState((){
                        isObscure=!isObscure;
                      });
                    },
                  )
                ),
              ),
              SizedBox(height: 10,),
              TextButton(
                  onPressed: (){
                    setLoginStatus(true).then((value){
                      Navigator.pushReplacementNamed(context, ContactListPage.routeName);
                    });
                  },
                  child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
