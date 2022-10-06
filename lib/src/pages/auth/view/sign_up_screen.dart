import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/pages/common_widgets/custom_text_field.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/services/mask_text_services.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    MaskText inputFormatter = MaskText();

    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: CustomColors.primaryColor,
                        ))),
              ),
              Column(children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "Cadastro",
                      style: TextStyle(
                          color: CustomColors.primaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),

                //formulário
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(45)),
                    color: CustomColors.primaryColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CustomTextField(
                        labelText: "Email",
                        prefixIcon: Icons.email,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const CustomTextField(
                        labelText: "Senha",
                        prefixIcon: Icons.lock,
                        isSecret: true,
                      ),
                      const CustomTextField(
                        labelText: "Nome",
                        prefixIcon: Icons.person,
                      ),
                      CustomTextField(
                        labelText: "Celular",
                        prefixIcon: Icons.phone,
                        inputFormatters: [inputFormatter.phonePhormatter()],
                        textInputType: TextInputType.phone,
                      ),
                      CustomTextField(
                        labelText: "CPF",
                        prefixIcon: Icons.file_copy,
                        inputFormatters: [inputFormatter.cpfFormatter()],
                        textInputType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18))),
                          onPressed: () {},
                          child: const Text(
                            "Entrar",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
