import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AssetManager.dart';
import 'package:evently/core/resources/constants.dart';
import 'package:evently/core/reusable_components/CustomButton.dart';
import 'package:evently/core/reusable_components/CustomField.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/StringManager.dart';

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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    repasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
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
                Image.asset(Assetmanager.Logo),
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
                  prefixPath: Assetmanager.person,
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
                  prefixPath: Assetmanager.email,
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
                  prefixPath: Assetmanager.lock,
                ),
                SizedBox(height: 16),
                CustomField(
                  keyboard: TextInputType.visiblePassword,
                  validation: (value) {
                    if (value != passwordController) {
                      return "Password not Match";
                    }
                  },
                  controller: repasswordController,
                  obscure: true,
                  hint: StringManager.rePassword.tr(),
                  prefixPath: Assetmanager.lock,
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  child: Custombutton(
                    title: StringManager.createAcc.tr(),
                    onClicked: () {
                      formKey.currentState!.validate();
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
                      onPressed: () {},
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
}
