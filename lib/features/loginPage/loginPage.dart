import 'package:flutter/material.dart';
import 'package:plant_app/features/signUpPage/signUpPage.dart';

import '../../utils/button.dart';
import '../../utils/colors.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(500, 75),
                          bottomLeft: Radius.elliptical(400, 80),
                        ),
                        image: DecorationImage(
                            opacity: 0.7,
                            image: NetworkImage(
                                "https://ignitewithhumana.com/wp-content/uploads/2021/02/CHUB.jpg",),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  const Text('Welcome back', style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500
                  )),
                  const Text(
                    'Login to your account',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey
                    )
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      children: [
                        textField(context,
                            label: 'Full Name', prefixIcon: const Icon(Icons.person)),
                        const SizedBox(
                          height: 20,
                        ),
                        textField(
                          context,
                          label: 'password',
                          obscure: true,
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        Row(
                          children: [
                            Checkbox(
                              side: const BorderSide(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              value: isSelect,
                              checkColor: Colors.green,
                              onChanged: (bool? value) {
                                setState(() {
                                  isSelect = value!;
                                });
                              },
                            ),
                            const Text(
                              'Remember me',
                              style: TextStyle(color: MyColors.baseColor),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.20,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forget password',
                                style: TextStyle(color: MyColors.baseColor),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.15,
                        ),
                        buttons(context,
                            label: 'Login',
                            onPressed: () {},
                            buttonColor: MyColors.baseColor,
                            textColor: Colors.white),
const SizedBox(
  height: 10,
),
                          Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700
                            ),),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                const SignUpPage()));
                              },
                              child: const Text(" SignUp",
                              style: TextStyle(
                              
                                fontWeight: FontWeight.w700
                              ),),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.34,
              left: MediaQuery.of(context).size.width * 0.80,
              child: SizedBox(
                width: 110,
                height: 110,
                child: Image.asset('assets/leaf.png'),
              ),
            )
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
}
