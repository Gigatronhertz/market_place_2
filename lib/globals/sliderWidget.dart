import 'package:flutter/material.dart';

class slider extends StatelessWidget {
  int page = 1;
  slider({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height / 80,
            width: 30,
            decoration: BoxDecoration(
                color:
                    page == 1 ? Color.fromARGB(240, 13, 151, 3) : Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                    topRight: Radius.circular(40))),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: 10,
          ),
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height / 80,
            width: 30,
            decoration: BoxDecoration(
                color:
                    page == 2 ? Color.fromARGB(240, 13, 151, 3) : Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                    topRight: Radius.circular(40))),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: 10,
          ),
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height / 80,
            width: 30,
            decoration: BoxDecoration(
                color:
                    page == 3 ? Color.fromARGB(240, 13, 151, 3) : Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                    topRight: Radius.circular(40))),
          ),
        ),
      ],
    );
  }
}
