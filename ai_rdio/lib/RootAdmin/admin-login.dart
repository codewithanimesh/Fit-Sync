import 'package:ai_rdio/RootAdmin/admin-main.dart';
import 'package:ai_rdio/Services/authSevices.dart';
import 'package:ai_rdio/gymOwner/owner-regisui.dart';
import 'package:ai_rdio/screen/Regis.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/owner.dart';
import '../components/InputBox.dart';
import '../components/customButton.dart';

class AdminRegLoginUi extends StatefulWidget {
  @override
  State<AdminRegLoginUi> createState() => _AdminRegLoginUiState();
}

class _AdminRegLoginUiState extends State<AdminRegLoginUi> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    gymOwner ownerAuth = gymOwner();
    // void logedin() {
    //   ownerAuth.ownerLogin(
    //       context: context,
    //       email: emailController.text,
    //       password: passwordController.text);
    // }
    void logedin() {
      final hardcodedEmail = 'admin@gmail.com';
      final hardcodedPassword = 'admin@000';

      // Check if the email and password match the hardcoded values
      if (emailController.text == hardcodedEmail &&
          passwordController.text == hardcodedPassword) {
        // Navigate to the next screen
        Get.to(() => SuperAdminMainPage());
      } else {
        // If login fails, display an error message
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Invalid email or password')),
        // );
        EasyLoading.showError('Invalid email or password');
        // EasyLoading.dismiss();
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              height: defaultLoginSize,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   'Select login type:',
                  //   style: TextStyle(fontSize: 20),
                  // ),

                  // ignore: prefer_const_constructors
                  Text(
                    'Welcome Admin',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 0.8,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

                  Image.asset('assets/images2/admin-login.jpg'),

                  SizedBox(height: 10),
                  InputBox(
                      icon: Icons.mail,
                      hint: 'Email',
                      hide: false,
                      controller: emailController),

                  InputBox(
                      icon: Icons.lock,
                      hint: 'Password',
                      hide: true,
                      controller: passwordController),

                  SizedBox(height: 15),

                  customButton(
                    text: 'LOGIN',
                    onpressed: () async {
                      logedin();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        // Regbtn(size: size)
      ]),
    );
  }
}

//---------------Register Button----------------
// class Regbtn extends StatelessWidget {
//   const Regbtn({
//     super.key,
//     required this.size,
//   });

//   final Size size;

//   @override
//   Widget build(BuildContext context) {
//     double viewInset = MediaQuery.of(context).viewInsets.bottom;

//     // return Positioned(
//     // top: 0,
//     // left: 0,
//     // right: 0,
//     // bottom: MediaQuery.of(context).viewInsets.bottom,
//     return Container(
//         child: viewInset == 0
//             ? Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   width: double.infinity,
//                   height: size.height * 0.07,
//                   decoration: BoxDecoration(
//                       // color: Color.fromARGB(255, 235, 179, 252),
//                       color: Color.fromARGB(255, 33, 33, 33),
//                       borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(50),
//                           topLeft: Radius.circular(50))),
//                   alignment: Alignment.center,
//                   child: RichText(
//                     text: TextSpan(
//                         text: 'Are you not a GymMate ? ',
//                         style: TextStyle(color: Colors.white, fontSize: 15),
//                         children: <TextSpan>[
//                           TextSpan(
//                             text: 'Register Here',
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 //Reg bottomSheet
//                                 Get.to(() => Ownerregis(),
//                                     transition: Transition.fade,
//                                     duration: Duration(milliseconds: 500));
//                               },
//                             style: TextStyle(
//                                 // color: Color.fromARGB(255, 67, 5, 124),
//                                 color: Colors.white,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ]),
//                   ),
//                 ),
//               )
//             : Container());
//   }
// }

// //------------Register UI Bottom Sheet-------------------------

