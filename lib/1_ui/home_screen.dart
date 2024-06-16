import 'package:amtha_sha3beya_admin/1_ui/widgets.dart';
import 'package:amtha_sha3beya_admin/2_bloc/amthal_cubit.dart';
import 'package:amtha_sha3beya_admin/3_data/models/mathal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController mathalContentController = TextEditingController();
  final TextEditingController mathalExplanationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AmthalCubit, AmthalState>(
      listener: (context, state) {
        if (state is AmthalLoaded) {
          showDialog(
              context: context,
              builder: (ctx) {
                return const AlertDialog(
                    content: Text(
                  "تم إضافة المثل بنجاح",
                  textAlign: TextAlign.center,
                ));
              });
        }
      },
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(flex: 2, child: SizedBox()),
                      Expanded(
                          flex: 2,
                          child: PhysicalModel(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            color: Colors.transparent,
                            elevation: 15,
                            child: TextFormField(
                              textAlign: TextAlign.right,
                              controller: mathalContentController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'متسيبش ده فاضي';
                                }
                                return null;
                              },
                              decoration:
                                  textFieldDecoration("أكتب مثل", false),
                              textDirection: TextDirection.ltr,
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: PhysicalModel(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            color: Colors.transparent,
                            elevation: 15,
                            child: TextFormField(
                              textAlign: TextAlign.right,
                              controller: mathalExplanationController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'متسيبش ده فاضي';
                                }
                                return null;
                              },
                              decoration:
                                  textFieldDecoration("شرح المثل", false),
                              textDirection: TextDirection.ltr,
                            ),
                          )),
                      const Expanded(flex: 2, child: SizedBox())
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<AmthalCubit>(context).addMathal(Mathal(
                          content: mathalContentController.text,
                          explanation: mathalExplanationController.text));
                      mathalContentController.text = "";
                      mathalExplanationController.text = "";
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 89, 97, 1)),
                  child: const Text(
                    "زود",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 59, 59, 59)),
                  child: const Text(
                    "خروج",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Expanded(flex: 1, child: SizedBox())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
