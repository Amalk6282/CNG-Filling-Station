import 'package:cng_filling_station/customcard.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Dashboard',
            style: TextStyle(fontSize: 35.0, color: Color(0xFF00A36C)),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              CustomCard(
                name: 'Current Bookings',
                count: '52',
                icon: Icons.book_online,
              ),
              SizedBox(
                width: 50,
              ),
              CustomCard(
                  name: 'Cylinder Capacity',
                  count: '87%',
                  icon: Icons.battery_5_bar),
              SizedBox(
                width: 50,
              ),
              CustomCard(
                  name: 'Current Reports',
                  count: '15',
                  icon: Icons.report_sharp),
              SizedBox(
                width: 50,
              ),
              CustomCard(
                  name: 'Current Prize', count: '86/kg', icon: Icons.money),
              SizedBox(
                width: 50,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            foregroundDecoration:
                BoxDecoration(border: Border.all(color: Color(0xFF00A36C))),
            height: 320,
            width: 1075,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
