import 'package:cng_filling_station/home_screen.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Reports',
                  style: TextStyle(fontSize: 35.0, color: Color(0xFF00A36C)),
                ),
              ),
              SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                ),
              ),
              SizedBox(
                width: 45,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xFF00A36C)),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    minimumSize: const Size(80.0, 50.0),
                    backgroundColor: Colors.white),
                child: Text(
                  'Filter',
                  style: TextStyle(fontSize: 18.0, color: Color(0xFF00A36C)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => Reportcard(),
                separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                itemCount: 10),
          )
        ]));
  }
}

class Reportcard extends StatelessWidget {
  const Reportcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
          border: Border.all(color: Color(0xFF00A36C)),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      height: 150,
      width: 1500,
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '#Title',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => HomeScreen());
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(80.0, 50.0),
                          backgroundColor: const Color(0xFF00A36C)),
                      child: Text(
                        'Details',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
              Row(
                children: [
                  Text(
                    'Freedom Fuel Filling Station',
                    style: TextStyle(fontSize: 14),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Veiw Details',
                        style: TextStyle(color: Color(0xFF00A36C)),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
