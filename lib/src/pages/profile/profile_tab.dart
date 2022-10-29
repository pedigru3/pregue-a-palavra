import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/pages/common_widgets/custom_text_field.dart';
import 'package:pregue_a_palavra/src/services/mask_text_services.dart';
import 'package:pregue_a_palavra/src/config/app_data.dart' as appData;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final MaskText inputFormatter = MaskText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: CustomColors.primaryColor,
        title: const Text('Perfil'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //
          //Email
          CustomTextField(
            isReadMode: true,
            isDarkMode: false,
            prefixIcon: Icons.email,
            labelText: 'Email',
            initialValue: appData.user.email,
          ),

          //Nome
          CustomTextField(
            isReadMode: true,
            isDarkMode: false,
            prefixIcon: Icons.person,
            labelText: 'Nome',
            initialValue: appData.user.fullname,
          ),

          //Celular
          CustomTextField(
            isReadMode: true,
            isDarkMode: false,
            prefixIcon: Icons.phone,
            labelText: 'Celular',
            initialValue: appData.user.phone,
            inputFormatters: [inputFormatter.phonePhormatter()],
          ),

          //CPF
          CustomTextField(
            isReadMode: true,
            isDarkMode: false,
            prefixIcon: Icons.file_copy,
            labelText: 'CPF',
            isSecret: true,
            initialValue: appData.user.cpf,
            inputFormatters: [inputFormatter.cpfFormatter()],
          ),

          // Botão para atualizar a senha
          SizedBox(
            height: 48,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    side:
                        BorderSide(width: 1, color: CustomColors.primaryColor)),
                onPressed: () {
                  updatePassoward();
                },
                child: Text(
                  "Atualizar minha senha",
                  style: TextStyle(color: CustomColors.primaryColor),
                )),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassoward() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text('Atualização de senha',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.secondaryColor)),
                        ),
                        const CustomTextField(
                          prefixIcon: Icons.lock,
                          labelText: 'Senha atual',
                          isDarkMode: false,
                          isSecret: true,
                        ),
                        const CustomTextField(
                          prefixIcon: Icons.lock_outline,
                          labelText: 'Nova senha',
                          isDarkMode: false,
                          isSecret: true,
                        ),
                        const CustomTextField(
                          prefixIcon: Icons.lock_outline,
                          labelText: 'Confirmar senha',
                          isDarkMode: false,
                          isSecret: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //Botão de Confirmação
                        SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18))),
                            child: const Text(
                              "Atualizar",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ]),
                ),
                Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ))
              ],
            ),
          );
        });
  }
}
