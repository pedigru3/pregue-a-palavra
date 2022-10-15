import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingBible extends StatelessWidget {
  const LoadingBible({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 224, 215, 215),
        highlightColor: const Color.fromARGB(255, 209, 209, 208),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 10),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.all(7.0),
              child: CustomLoading(),
            );
          },
        ),
      ),
    );
  }
}

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.83,
            height: 12,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 12,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
