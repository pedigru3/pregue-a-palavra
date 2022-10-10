import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/pages/bible/controllers/bible_controller.dart';
import 'package:pregue_a_palavra/src/pages/bible/views/book_search.dart';
import 'package:provider/provider.dart';

class BibleTab extends StatefulWidget {
  const BibleTab({Key? key}) : super(key: key);

  @override
  State<BibleTab> createState() => _BibleTabState();
}

class _BibleTabState extends State<BibleTab> {
  final BibleController controller = BibleController();
  final _book = 'Salmos';
  final _chapter = '119';

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BibleController>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            // ----------------------------HEADER----------------------------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // =========== Botao Versículo ============
                  GestureDetector(
                    onTap: () {
                      showSearch(context: context, delegate: BookSearch());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: CustomColors.primaryColor,
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Text(
                          '$_book $_chapter',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 1),
                  Container(
                    decoration: BoxDecoration(
                        color: CustomColors.primaryColor,
                        borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(20))),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      child: Text(
                        'NVI',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 2,
              color: Colors.blue,
              thickness: 2,
            ),
            Expanded(
              child: GestureDetector(
                  onHorizontalDragUpdate: ((details) {
                    print(details.delta.dx > 0);
                  }),
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Visibility(
                        visible: controller.bible != null,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.bible != null
                                ? controller.bible!.chapter.verses
                                : 0,
                            itemBuilder: (_, index) {
                              return Text.rich(TextSpan(children: [
                                TextSpan(
                                    text:
                                        '${controller.bible!.verses[index].number}'),
                                TextSpan(
                                    text: controller.bible!.verses[index].text)
                              ]));
                            }),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
