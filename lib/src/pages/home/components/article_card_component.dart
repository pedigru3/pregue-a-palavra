import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';

class ArticleCardComponent extends StatelessWidget {
  const ArticleCardComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://static.wixstatic.com/media/53a71b_7300ffc776ca4ad986043935195a0788~mv2.jpg',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Uma contribuição batista para a teologia pública',
              style: TextStyle(fontSize: 15, color: CustomColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
