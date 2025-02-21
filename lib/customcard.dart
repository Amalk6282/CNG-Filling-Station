import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name, count;
  final IconData icon;
  const CustomCard({
    super.key,
    required this.name,
    required this.count,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 230,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 45,
          ),
          Icon(
            icon,
            size: 60,
          ),
          Text(name, style: TextStyle(fontSize: 15)),
          Text(
            count,
            style: TextStyle(fontSize: 50),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Manage',
                style: TextStyle(fontSize: 15, color: Color(0xFF00A36C)),
              ))
        ],
      ),
    );
  }
}
