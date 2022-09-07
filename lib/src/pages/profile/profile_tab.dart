import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/pages/common_widgets/custom_text_field.dart';
import 'package:pregue_a_palavra/src/services/mask_text_services.dart';
import 'package:pregue_a_palavra/src/config/app_data.dart' as appData;

class ProfileTab extends StatelessWidget {
  ProfileTab({Key? key}) : super(key: key);
  final MaskText inputFormatter = MaskText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            initialValue: appData.user.name,
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
                onPressed: () {},
                child: Text(
                  "Atualizar senha",
                  style: TextStyle(color: CustomColors.primaryColor),
                )),
          ),
        ],
      ),
    );
  }
}
