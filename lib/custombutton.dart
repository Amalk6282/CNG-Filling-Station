import 'package:flutter/material.dart';

class DrawerItemButton extends StatelessWidget {
  final Function() onTap;
  final bool inverse;
  final IconData iconData;
  final String label;
  const DrawerItemButton({
    super.key,
    required this.onTap,
    this.inverse = true,
    required this.iconData,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: inverse ? Color(0xFFE7EEE7) : Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Icon(
                iconData,
                color: inverse ? Color(0xFF00A36C) : Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                label,
                style: TextStyle(
                    color: inverse ? Color(0xFF00A36C) : Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
