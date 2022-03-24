import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final Function()? onPressed;
  const CustomAppbar({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.more_vert,
          color: Colors.grey,
        ),
      ),
      title: SizedBox(
        height: 30,
        width: 100,
        child: Image.asset(
          'assets/intesasoft.png',
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.account_circle,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
