import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/DialogUtils.dart';
import 'package:evently/core/reusable_components/CustomButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/resources/AssetManager.dart';
import '../../../core/resources/StringManager.dart';
import '../../../core/resources/constants.dart';
import '../../../core/reusable_components/CustomField.dart';

class ForgetPassScreen extends StatefulWidget {
  static const String routeName = 'forget_pass';

  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StringManager.forgetpassword.tr())),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AssetManager.forgetpass),
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
                SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  child: Custombutton(
                    title: StringManager.resetpass.tr(),
                    onClicked: () async {
                      if (formKey.currentState?.validate() ?? false) {
                        DialogUtils.showLoadingDialog(context);
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: emailController.text,
                        );
                        Navigator.pop(context);
                        DialogUtils.showToast("Check Your Email");
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
