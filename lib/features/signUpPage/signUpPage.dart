import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/features/loginPage/loginPage.dart';

import '../../utils/button.dart';
import '../../utils/colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    TextEditingController passController = TextEditingController();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  const Text(
                    'Register',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    'Create your new account',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 40),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          textField1(context, validator: (name) {
                            if (name!.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                              label: 'Full Name',
                              prefixIcon: const Icon(Icons.person)),
                          const SizedBox(
                            height: 20,
                          ),
                          textField1(
                            context,
                            validator: (email) {
                              if (email!.isEmpty || !email.contains('@')) {
                                return 'Please enter a email';
                              }
                              return null;
                            },
                            label: 'email address',
                            obscure: true,
                            prefixIcon: const Icon(Icons.lock),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          textField1(
                            context,
                            validator: (pass) {
                              if (pass!.isEmpty) {
                                return 'Enter a password';
                              }
                              return null;
                            },
                            label: 'password',
                            obscure: true,
                            prefixIcon: const Icon(Icons.lock),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          textField1(
                            context,
                            validator: (Pass1) {
                              if (Pass1!.isEmpty ||
                                  Pass1 != passController.text) {
                                return 'Re-enter your password';
                              }
                              return null;
                            },
                            label: 'confirm password',
                            obscure: true,
                            prefixIcon: const Icon(Icons.lock),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          // ),

                          RichText(
                            text: TextSpan(
                              text: "By signing you agree to our ",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Term of use \n '
                                      '              and privacy notice',
                                  style: const TextStyle(
                                    color: MyColors.baseColor,
                                    fontSize: 16,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => const SignUpPage(),
                                          ),
                                        ),
                                )
                              ],
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.1,
                          ),
                          buttons(context,
                              buttonColor: MyColors.baseColor,
                              label: 'Sign up',
                              onPressed: () {
                                var valid = formKey.currentState!.validate();
                                if (valid == true) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text("Registration success"),
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const LoginPage(),
                                    ),
                                  );
                                }

                              },
                              textColor: Colors.white),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Already have an account?  ",
                              style: TextStyle(
                                color: MyColors.greyColor,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: 'login',
                                  style: const TextStyle(
                                      color: MyColors.baseColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => const LoginPage(),
                                          ),
                                        ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.12,
              left: MediaQuery.of(context).size.width * 0.75,
              child: SizedBox(
                width: 110,
                height: 110,
                child: Image.asset('assets/leaf.png'),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.06,
                left: MediaQuery.of(context).size.height * 0.04,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                      )),
                ))
          ],
        ),
      ),
    );
  }

  Widget textField(BuildContext context,
      {required Icon prefixIcon, required String label, bool obscure = false}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: MyColors.textFieldColor,
      ),
      child: TextFormField(
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconColor: MyColors.baseColor,
          label: Text(
            label,
            style: const TextStyle(color: MyColors.baseColor, fontSize: 15),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: MyColors.baseColor),
          ),
        ),
      ),
    );
  }

  Widget textField1(
    BuildContext context, {
    required Icon prefixIcon,
    required String label,
    bool obscure = false,
    String? Function(String?)? validator,
    TextEditingController? controller,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      obscureText: obscure,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: MyColors.textFieldColor,
        prefixIcon: prefixIcon,
        prefixIconColor: MyColors.baseColor,
        suffixIcon: suffixIcon,
        hintText: label,
        hintStyle: const TextStyle(color: MyColors.baseColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: MyColors.baseColor),
        ),
      ),
    );
  }
}
