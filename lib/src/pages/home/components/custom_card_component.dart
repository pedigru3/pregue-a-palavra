import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';

class CustomCardComponent extends StatelessWidget {
  const CustomCardComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(10),
      color: CustomColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              'Pregue a Palavra realiza congresso nos dias 23 a 28 de outubro',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.primaryColor),
            ),
            const SizedBox(height: 10),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://static.wixstatic.com/media/2eb080_655fb0479b904200a9b5202e43ea2d1c~mv2_d_6000_4000_s_4_2.jpg/v1/fill/w_3330,h_2220,al_c,q_90/2eb080_655fb0479b904200a9b5202e43ea2d1c~mv2_d_6000_4000_s_4_2.webp'),
                  )),
            ),
            const SizedBox(height: 10),
            const Text(
              'Proin faucibus scelerisque nibh in tempus. Praesent sed sapien enim. Sed pretium quam purus, quis finibus leo viverra at. Cras vitae feugiat risus. Aenean convallis mi lacus, et facilisis nunc scelerisque eget.',
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Text(
                          'Saiba mais ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        )
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
