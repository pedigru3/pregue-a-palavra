import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/pages/auth/controller/auth_controller.dart';
import 'package:pregue_a_palavra/src/pages/common_widgets/custom_text_field.dart';
import 'package:pregue_a_palavra/src/pages_routes/app_pages.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  //Controlador de texto
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: CustomColors.backgroundColor,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage("images/icon.png"),
                        ),

                        //Categorias
                        SizedBox(
                          height: 50,
                          child: DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: CustomColors.secondaryColor),
                            child: AnimatedTextKit(
                                pause: Duration.zero,
                                repeatForever: true,
                                animatedTexts: [
                                  FadeAnimatedText("LIVRARIA"),
                                  FadeAnimatedText("NOTÍCIAS"),
                                  FadeAnimatedText("VIDEOAULAS"),
                                  FadeAnimatedText("CURSOS"),
                                ]),
                          ),
                        )
                      ]),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: CustomColors.primaryColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),

                //Formulário
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //E-mail
                      CustomTextField(
                        labelText: "E-mail",
                        prefixIcon: Icons.email,
                        hintText: "Exemple@exemple.com",
                        controller: emailController,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Digite seu e-mail';
                          }
                          if (!email.isEmail) return 'Digite um email';

                          return null;
                        },
                      ),

                      // Senha
                      CustomTextField(
                        labelText: "Senha",
                        prefixIcon: Icons.lock,
                        isSecret: true,
                        hintText: "Digite sua senha",
                        controller: passwordController,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Digite sua senha';
                          }
                          if (password.length < 7) {
                            return 'Digite uma senha com pelo menos 7 caracteres';
                          }
                          return null;
                        },
                      ),

                      //Entrar
                      SizedBox(
                        height: 48,
                        child: Visibility(
                          visible: !authController.islooding,
                          replacement: const Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: 38,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                authController
                                    .sigIn(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    )
                                    .then((value) => authController.isLoggedIn
                                        ? Navigator.of(context)
                                            .pushReplacementNamed(
                                                PagesRoute.baseRoute)
                                        : null);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                            child: const Text("Entrar"),
                          ),
                        ),
                      ),

                      //Esqueceu a senha
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Esqueceu a senha?",
                            style: TextStyle(color: CustomColors.detailColor),
                          ),
                        ),
                      ),

                      //Divisor ou
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                            color: CustomColors.backgroundColor,
                          )),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "ou",
                              style: TextStyle(
                                  color: CustomColors.backgroundColor),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            color: CustomColors.backgroundColor,
                          ))
                        ],
                      ),

                      // Botão novo usuário
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SizedBox(
                          height: 48,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  side: BorderSide(
                                      width: 1,
                                      color: CustomColors.backgroundColor)),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(PagesRoute.signUpRoute);
                              },
                              child: Text(
                                "Criar conta",
                                style: TextStyle(
                                    color: CustomColors.backgroundColor),
                              )),
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
    );
  }
}
