import 'package:flutter_modular/flutter_modular.dart';
import 'package:design_leveling/app/modules/register/register_store.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/colors_const.dart';
import '../../shared/constants/string_const.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, this.title = 'RegisterPage'}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final RegisterStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: ColorsConst.primary2,
              height: size.height * 0.4,
              width: size.width * 1,
              child: const Center(
                child: Text(
                  StringConst.appTitle,
                  style: TextStyle(
                    overflow: TextOverflow.clip,
                    color: ColorsConst.neutral100,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lexend',
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.05, left: 10),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: ColorsConst.black100,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.3),
                child: Container(
                  height: size.height * 0.65,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 24, 0, 10),
                        child: Text(
                          StringConst.register,
                          style:
                              TextStyle(fontSize: 20, color: Color(0xff3B66A4)),
                        ),
                      ),
                      SizedBox(
                        width: 292,
                        height: 400,
                        child: Form(
                          key: store.keyRegisterForm,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    errorStyle: TextStyle(height: 0.3),
                                    hintText: StringConst.userName,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (store
                                        .emailInputController.text.isEmpty) {
                                      return StringConst.emptyEmail;
                                    } else if (store.emailAlreadyUsed == true) {
                                      return StringConst.emailAlreadyUsed;
                                    }
                                    return null;
                                  },
                                  controller: store.userNameInputController,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    errorStyle: TextStyle(height: 0.3),
                                    hintText: StringConst.email,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (store
                                        .emailInputController.text.isEmpty) {
                                      return StringConst.emptyEmail;
                                    } else if (store.emailAlreadyUsed == true) {
                                      return StringConst.emailAlreadyUsed;
                                    }
                                    return null;
                                  },
                                  controller: store.emailInputController,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  obscureText: store.isObscure,
                                  decoration: InputDecoration(
                                    errorStyle: const TextStyle(height: 0.3),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                    ),
                                    hintText: StringConst.password,
                                    suffixIcon: IconButton(
                                      icon: Icon(store.isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                      onPressed: () {
                                        setState(
                                          () {
                                            store.isObscure = !store.isObscure;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return StringConst.emptyPassword;
                                    } else if (store.isWeakPassword == true) {
                                      return StringConst.weakPassword;
                                    }
                                    return null;
                                  },
                                  controller: store.passwordInputController,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  obscureText: store.isObscure,
                                  decoration: InputDecoration(
                                    errorStyle: const TextStyle(height: 0.3),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                    ),
                                    hintText: StringConst.confirmPassword,
                                    suffixIcon: IconButton(
                                      icon: Icon(store.isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                      onPressed: () {
                                        setState(
                                          () {
                                            store.isObscure = !store.isObscure;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return StringConst.emptyPassword;
                                    } else if (value !=
                                        store.passwordInputController.text) {
                                      return StringConst.mismatchPassword;
                                    } else if (store.isWeakPassword == true) {
                                      return StringConst.weakPassword;
                                    }
                                    return null;
                                  },
                                  controller:
                                      store.confirmPasswordInputController,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 290,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff3B66A4),
                                  ),
                                  child: const Text(
                                    StringConst.makeRegister,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (store.keyRegisterForm.currentState!
                                        .validate()) {
                                      store.createAccount();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            backgroundColor:
                                                ColorsConst.white20,
                                            content: Text(
                                                StringConst.processingData)),
                                      );
                                      Future.delayed(const Duration(seconds: 1),
                                          () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            backgroundColor:
                                                ColorsConst.infoColor1,
                                            content: Text(
                                              StringConst.registerComplete,
                                            ),
                                          ),
                                        );
                                      }).then(
                                        (value) => Future.delayed(
                                          const Duration(seconds: 3),
                                          () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      );
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
