import 'package:flutter/material.dart';

class CurrentBookings extends StatelessWidget {
  const CurrentBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return UserTable();
  }
}

class UserTable extends StatelessWidget {
  const UserTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
          child: Row(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Current Bookings',
                style: TextStyle(fontSize: 35.0, color: Color(0xFF00A36C)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Material(
            child: SizedBox(
              height: 500,
              width: double.infinity,
              child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Expanded(
                        child: Text('Booking No.'),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Name',
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Type of Vehicle',
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Time',
                        ),
                      ),
                    ),
                  ],
                  rows: List.generate(
                    7,
                    (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text('1')),
                        DataCell(Text('Sarah')),
                        DataCell(Text('Auto Rikshaw')),
                        DataCell(Text('9:30 am'))
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
