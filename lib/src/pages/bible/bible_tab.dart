import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pregue_a_palavra/src/pages/bible/controllers/value_controller.dart';
import 'package:pregue_a_palavra/src/repositories/bible_repository.dart';
import 'package:http/http.dart' as http;

class BibleTab extends StatelessWidget {
  BibleTab({Key? key}) : super(key: key);

  BibleRepository repository = BibleRepository(http.Client());
  final nameController = TextEditingController();
  final textController = TextEditingController();
  final valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    print('criou árvore');
    return Scaffold(
        appBar: AppBar(
            title:
                //Valor
                GetX<ValueController>(
          init: valueController,
          initState: (_) {},
          builder: (ctrl) {
            return Text(ctrl.definedValue.value);
          },
        )),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextField(
                controller: textController,
              ),
              SizedBox(
                height: 20,
              ),
              GetX<ValueController>(
                  init: valueController,
                  builder: (crtl) {
                    return crtl.isLoading.value
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              String value = textController.text;
                              print(value);
                              valueController.boasVindas(nameController.text);

                              valueController.setValue(value);
                            },
                            child: Text('Me teste'));
                  }),
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: 'Qual é o seu nome?'),
              ),
              SizedBox(
                height: 20,
              ),
             GetX<ValueController>(
                init: valueController,
                initState: (_) {},
                builder: (ctrl) {
                  return Text(
                    ctrl.name.value,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  );
                },
              )
            ]),
          ),
        ));
  }
}
