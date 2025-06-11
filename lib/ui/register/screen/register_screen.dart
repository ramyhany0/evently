import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/DialogUtils.dart';
import 'package:evently/core/FirebaseHandler.dart';
import 'package:evently/core/resources/AssetManager.dart';
import 'package:evently/core/resources/ColorManager.dart';
import 'package:evently/core/resources/constants.dart';
import 'package:evently/core/reusable_components/CustomButton.dart';
import 'package:evently/core/reusable_components/CustomField.dart';
import 'package:evently/ui/login/screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:evently/model/User.dart' as MyUser;

import '../../../core/resources/StringManager.dart';
import '../../home/screen/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController repasswordController;
  late TextEditingController ageController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String selectedGender = "male";
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repasswordController = TextEditingController();
    ageController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
    ageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StringManager.register.tr())),
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
                  keyboard: TextInputType.name,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Should not be empty";
                    } else {
                      return null;
                    }
                  },
                  controller: nameController,
                  hint: StringManager.name.tr(),
                  prefixPath: AssetManager.person,
                ),
                SizedBox(height: 16),
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
                SizedBox(height: 16),
                CustomField(
                  keyboard: TextInputType.visiblePassword,
                  validation: (value) {
                    if (value != passwordController.text) {
                      return "Password not match";
                    }
                  },
                  controller: repasswordController,
                  obscure: true,
                  hint: StringManager.rePassword.tr(),
                  prefixPath: AssetManager.lock,
                ),
                SizedBox(height: 16),
                CustomField(
                  keyboard: TextInputType.number,
                  validation: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your age";
                    }
                  },
                  controller: ageController,
                  obscure: false,
                  hint: StringManager.age.tr(),
                  prefixPath: AssetManager.person,
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintStyle: Theme.of(context).textTheme.titleSmall,
                    hintText: StringManager.genderHint.tr(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: ColorManager.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: ColorManager.grey),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: ColorManager.grey),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: ColorManager.grey),
                    ),
                  ),
                  hint: Text(StringManager.genderHint.tr()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Should not be empty";
                    }
                    return null;
                  },
                  items: [
                    DropdownMenuItem<String>(
                      value: "male",
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AssetManager.male,
                            width: 24,
                            height: 24,
                            colorFilter: ColorFilter.mode(
                              ColorManager.blue,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(StringManager.male.tr()),
                        ],
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: "female",
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AssetManager.female,
                            width: 24,
                            height: 24,
                            colorFilter: ColorFilter.mode(
                              ColorManager.blue,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(StringManager.female.tr()),
                        ],
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    selectedGender = value!;
                  },
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  child: Custombutton(
                    title: StringManager.createAcc.tr(),
                    onClicked: () {
                      if (formKey.currentState?.validate() ?? false) {
                        signup();
                      }
                    },
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringManager.alreadyHaveAcc.tr(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, LoginScreen.routeName);
                      },
                      child: Text(
                        StringManager.login.tr(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  signup() async {
    try {
      DialogUtils.showLoadingDialog(context);
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
      await FirebaseHandler.addUser(
        MyUser.User(
          name: nameController.text,
          email: emailController.text,
          gender: selectedGender,
          age: ageController.text,
          id: credential.user?.uid,
        ),
      );
      Navigator.pop(context);
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.routeName,
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'weak-password') {
        DialogUtils.showMessageDialog(
          context: context,
          message: "The password provided is too weak.",
          posTitle: "OK",
          posClick: () {
            Navigator.pop(context);
          },
        );
      } else if (e.code == 'email-already-in-use') {
        DialogUtils.showMessageDialog(
          context: context,
          message: "The account already exists for that email.",
          posTitle: "OK",
          posClick: () {
            Navigator.pop(context);
          },
        );
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
