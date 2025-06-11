import 'package:easy_localization/easy_localization.dart';
import 'package:evently/providers/UserProvider.dart';
import 'package:evently/ui/home/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:evently/model/User.dart' as MyUser;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import '../../../core/DialogUtils.dart';
import '../../../core/FirebaseHandler.dart';
import '../../../core/resources/AssetManager.dart';
import '../../../core/resources/StringManager.dart';
import '../../../core/resources/constants.dart';
import '../../../core/reusable_components/CustomButton.dart';
import '../../../core/reusable_components/CustomField.dart';
import '../../forget_pass/screen/forget_pass_screen.dart';
import '../../register/screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AssetManager.Logo),
                SizedBox(height: 28),

                CustomField(
                  keyboard: TextInputType.emailAddress,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Should not be empty";
                    }
                    if (!RegExp(emailRegex).hasMatch(value)) {
                      return "Email is not valid";
                    }
                  },
                  controller: emailController,
                  hint: StringManager.email.tr(),
                  prefixPath: AssetManager.email,
                ),
                SizedBox(height: 16),
                CustomField(
                  keyboard: TextInputType.visiblePassword,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Should not be empty";
                    }
                    if (value.length < 8) {
                      return "Password should be  less than 8 characters";
                    }
                  },
                  controller: passwordController,
                  obscure: true,
                  hint: StringManager.password.tr(),
                  prefixPath: AssetManager.lock,
                ),

                TextButton(
                  onPressed: () {},
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          ForgetPassScreen.routeName,
                        );
                      },
                      child: Text(
                        StringManager.forgetpassword.tr(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  child: Custombutton(
                    title: StringManager.login.tr(),
                    onClicked: () {
                      if (formKey.currentState?.validate() ?? false) {
                        login();
                      }
                    },
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringManager.dontHaveAcc.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: Text(
                        StringManager.createAcc.tr(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.5,
                      ),
                    ),
                    onPressed: () {
                      signInWithGoogle();
                    },
                    label: Text(
                      StringManager.loginWithGoogle.tr(),
                      style: TextStyle(fontSize: 20),
                    ),
                    icon: SvgPicture.asset("assets/images/googleicon.svg"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    UserProvider provider = Provider.of<UserProvider>(context, listen: false);
    try {
      DialogUtils.showLoadingDialog(context);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      MyUser.User? myUser = await FirebaseHandler.getUser(
        credential.user?.uid ?? "",
      );
      provider.saveUser(myUser);
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        DialogUtils.showMessageDialog(
          context: context,
          message: "No user found for that email.",
          posTitle: "Ok",
          posClick: () {
            Navigator.pop(context);
          },
        );
      } else if (e.code == 'wrong-password') {
        DialogUtils.showMessageDialog(
          context: context,
          message: "Wrong password provided for that user.",
          posTitle: "Ok",
          posClick: () {
            Navigator.pop(context);
          },
        );
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
