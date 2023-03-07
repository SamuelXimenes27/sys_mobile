import 'package:design_leveling/app/shared/constants/colors_const.dart';
import 'package:design_leveling/app/shared/constants/string_const.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'login_store.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({
    Key? key,
    this.title = 'LoginPage',
  }) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
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
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.3),
                child: Container(
                  height: size.height * 0.5,
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
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 24, 0, 10),
                          child: Text(
                            StringConst.makeLogin,
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff3B66A4)),
                          ),
                        ),
                        SizedBox(
                          width: 292,
                          height: 243,
                          child: Form(
                            key: store.keyLoginForm,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      errorStyle: TextStyle(height: 0.5),
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
                                      }
                                      return null;
                                    },
                                    controller: store.emailInputController,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: TextFormField(
                                    obscureText: store.isObscure,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(
                                          fontSize: 12, height: 0.5),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                      ),
                                      hintText: StringConst.password,
                                      suffixIcon: IconButton(
                                        icon: Icon(store.isObscure
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                        onPressed: () {
                                          setState(
                                            () {
                                              store.isObscure =
                                                  !store.isObscure;
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return StringConst.emptyPassword;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: SizedBox(
                                    width: 290,
                                    height: 50,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff3B66A4),
                                      ),
                                      child: const Text(
                                        StringConst.login,
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      onPressed: () {
                                        if (store.keyLoginForm.currentState!
                                            .validate()) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content:
                                                    Text('Processing Data')),
                                          );
                                        }
                                      },
                                    ),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
