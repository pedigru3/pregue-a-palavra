import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskText {
  cpfFormatter() {
    return MaskTextInputFormatter(
      mask: "###.###.###-##",
      filter: {'#': RegExp(r'[0-9]')},
    );
  }

  phonePhormatter() {
    return MaskTextInputFormatter(
      mask: "(##) # ####-####",
      filter: {'#': RegExp(r'[0-9]')},
    );
  }
}
