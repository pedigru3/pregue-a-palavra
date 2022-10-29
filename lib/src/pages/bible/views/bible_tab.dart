import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/pages/bible/components/buttom_version.dart';
import 'package:pregue_a_palavra/src/pages/bible/controllers/bible_controller.dart';
import 'package:pregue_a_palavra/src/pages/bible/views/book_search.dart';
import 'package:pregue_a_palavra/src/pages/bible/views/chapters_view.dart';
import 'package:pregue_a_palavra/src/pages/bible/views/loading_bible.dart';
import 'package:provider/provider.dart';

enum Direction { none, rigth, left }

class BibleTab extends StatefulWidget {
  const BibleTab({Key? key}) : super(key: key);

  @override
  State<BibleTab> createState() => _BibleTabState();
}

class _BibleTabState extends State<BibleTab> {
  final double _fontSize = 16;

  bool active = false;
  Direction direction = Direction.none;
  double positionStart = 0.0;
  double positionEnd = 0.0;

  _onHorizontalDragEnd(DragEndDetails details, BibleController controller) {
    if (direction == Direction.rigth && positionEnd - positionStart > 50) {
      controller.previousBook();
    } else if (direction == Direction.left &&
        positionStart - positionEnd > 50) {
      controller.nextBook();
    }
  }

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
                  // =========== Botao LIVRO ============
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
                        padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                        child: Text(
                          controller.bible.book.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 1),

                  //-------BOTAO CAPÍTULO-------
                  GestureDetector(
                    onTap: () async {
                      int? newChapter =
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => ChaptersView(
                                    book: controller.bible.book,
                                  )));
                      controller.setChapter = newChapter ?? 1;
                      controller.search();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomColors.primaryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
                        child: Text(
                          '${controller.bible.chapter.number}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 1),

                  // ---- BOTAO VERSAO------------
                  ButtomVersion(),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.font_download_outlined,
                      color: CustomColors.primaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: CustomColors.primaryColor,
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

            // -------------------------------- VERSES ------------------------
            Expanded(
              child: Stack(
                children: [
                  GestureDetector(
                      onHorizontalDragStart: (details) {
                        positionStart = details.globalPosition.dx;
                      },
                      onHorizontalDragUpdate: ((details) {
                        positionEnd = details.globalPosition.dx;
                        if (details.delta.dx > 0) {
                          direction = Direction.rigth;
                        } else if (details.delta.dx < 0) {
                          direction = Direction.left;
                        }
                      }),
                      onHorizontalDragEnd: (details) =>
                          _onHorizontalDragEnd(details, controller),
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Visibility(
                            visible: !controller.isLoading,
                            replacement: const Center(
                              child: LoadingBible(),
                            ),
                            child: ListView.builder(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 50),
                                physics: const BouncingScrollPhysics(),
                                itemCount: controller.bible.chapter.verses,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: VerseSelectable(
                                        index: index,
                                        controller: controller,
                                        fontSize: _fontSize),
                                  );
                                }),
                          ))),
                  //----------BUTTOM NEXT------------
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: InkWell(
                      onTap: () {
                        controller.nextChapter();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: CustomColors.primaryColor),
                        child: const Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: InkWell(
                      onTap: () {
                        controller.previousChapter();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: CustomColors.primaryColor),
                        child: const Icon(
                          Icons.arrow_left,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerseSelectable extends StatelessWidget {
  const VerseSelectable({
    Key? key,
    required this.controller,
    required double fontSize,
    required this.index,
  })  : _fontSize = fontSize,
        super(key: key);

  final BibleController controller;
  final double _fontSize;
  final int index;

  get active => controller.bible.verses[index].isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.selecionar(index),
      child: Text.rich(
        TextSpan(
            children: [
              TextSpan(
                text: '   ${controller.bible.verses[index].number} ',
                style: TextStyle(fontSize: _fontSize - 5),
              ),
              TextSpan(
                text: controller.bible.verses[index].text,
                style: TextStyle(
                    fontSize: _fontSize,
                    backgroundColor:
                        active ? Colors.blue.shade100 : Colors.transparent),
              ),
            ],
            style: active
                ? const TextStyle(
                    fontWeight: FontWeight.bold,
                  )
                : null),
      ),
    );
  }
}
