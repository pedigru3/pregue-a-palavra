import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/pages/common_widgets/custom_text_field.dart';
import 'package:pregue_a_palavra/src/pages/auth/sign_up_screen.dart';
import 'package:pregue_a_palavra/src/pages/base/base_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //E-mail
                    const CustomTextField(
                      labelText: "E-mail",
                      prefixIcon: Icons.email,
                      hintText: "Exemple@exemple.com",
                    ),

                    // Senha
                    const CustomTextField(
                      labelText: "Senha",
                      prefixIcon: Icons.lock,
                      isSecret: true,
                      hintText: "Digite sua senha",
                    ),

                    //Entrar
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (c) => const BaseScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        child: const Text("Entrar"),
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
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "ou",
                            style:
                                TextStyle(color: CustomColors.backgroundColor),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const SignUpScreen()));
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
            ],
          ),
        ),
      ),
    );
  }
}
