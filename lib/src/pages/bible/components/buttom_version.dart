import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/constants/versions_options.dart';
import 'package:pregue_a_palavra/src/pages/bible/controllers/bible_controller.dart';

class ButtomVersion extends StatefulWidget {
  const ButtomVersion({Key? key}) : super(key: key);

  @override
  State<ButtomVersion> createState() => _ButtomVersionState();
}

class _ButtomVersionState extends State<ButtomVersion>
    with TickerProviderStateMixin {
  bool _isSelected = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  List<String> versions = [VersionsOptions.nvi, VersionsOptions.ra];

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = BibleController();
    _controller.forward();
    return AnimatedContainer(
      width: _isSelected ? 120 : 50,
      height: 32,
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
          color: CustomColors.primaryColor,
          borderRadius:
              const BorderRadius.horizontal(right: Radius.circular(20))),
      duration: const Duration(milliseconds: 600),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: ListView.builder(
          itemCount: versions.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return DefaultTextStyle(
              style: TextStyle(color: CustomColors.backgroundColor),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isSelected = !_isSelected;
                    if (index != 0) {
                      controller.setVersion(versions[index]);
                      var removed = versions.removeAt(index);
                      versions.insert(0, removed);
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(versions[index].toUpperCase()),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
