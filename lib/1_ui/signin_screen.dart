import 'package:amtha_sha3beya_admin/1_ui/home_screen.dart';
import 'package:amtha_sha3beya_admin/1_ui/widgets.dart';
import 'package:amtha_sha3beya_admin/2_bloc/amthal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../3_data/services/auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(flex: 3, child: SizedBox()),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    const Text(
                      "أمثلة شعبية",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    PhysicalModel(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      color: Colors.transparent,
                      elevation: 15,
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'متسيبش ده فاضي';
                          }
                          return null;
                        },
                        decoration: textFieldDecoration("email..", true),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PhysicalModel(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      color: Colors.transparent,
                      elevation: 15,
                      child: TextFormField(
                        controller: passController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'متسيبش ده فاضي';
                          }
                          return null;
                        },
                        decoration: textFieldDecoration("pass..", true),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  print(emailController.text);
                  print(passController.text);
                  if (_formKey.currentState!.validate()) {
                    print("entered ere");
                    Auth auth = Auth();
                    auth
                        .signInWithEmailAndPassword(
                            emailController.text, passController.text)
                        .then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return BlocProvider(
                          create: (context) => AmthalCubit(),
                          child: const HomeScreen(),
                        );
                      }));
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 43, 40, 4)),
                child: const Text(
                  "تسجيل دخول",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const Expanded(flex: 3, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
