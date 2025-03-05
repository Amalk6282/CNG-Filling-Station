import 'package:cng_filling_station/custombutton.dart';
import 'package:cng_filling_station/profile_screen.dart';
import 'package:cng_filling_station/screens/current_bookings.dart';
import 'package:cng_filling_station/screens/dashboard.dart';
import 'package:cng_filling_station/screens/report_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7EEE7),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 250,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 60.0,
                ),
                Text(
                  'CNGify',
                  style: TextStyle(fontSize: 25, color: Color(0xFF00A36C)),
                ),
                SizedBox(height: 80.0),
                CustomButton(
                  inverse: _tabController.index == 0,
                  iconData: Icons.dashboard,
                  label: 'Dashboard',
                  onTap: () {
                    _tabController.animateTo(0);
                    setState(() {});
                  },
                ),
                CustomButton(
                  inverse: _tabController.index == 1,
                  iconData: Icons.book_online_outlined,
                  label: 'Current Bookings',
                  onTap: () {
                    _tabController.animateTo(1);
                    setState(() {});
                  },
                ),
                CustomButton(
                  inverse: _tabController.index == 2,
                  iconData: Icons.battery_5_bar,
                  label: 'Cylinder Capacity',
                  onTap: () {
                    _tabController.animateTo(2);
                    setState(() {});
                  },
                ),
                CustomButton(
                  inverse: _tabController.index == 3,
                  iconData: Icons.report_gmailerrorred_outlined,
                  label: 'Current Reports',
                  onTap: () {
                    _tabController.animateTo(3);
                    setState(() {});
                  },
                ),
                CustomButton(
                  inverse: _tabController.index == 4,
                  iconData: Icons.money,
                  label: 'Current Prize',
                  onTap: () {
                    _tabController.animateTo(4);
                    setState(() {});
                  },
                ),
                CustomButton(
                  inverse: _tabController.index == 5,
                  iconData: Icons.account_circle_outlined,
                  label: 'Profile',
                  onTap: () {
                    _tabController.animateTo(5);
                    setState(() {});
                  },
                ),
                Spacer(),
                CustomButton(
                  inverse: false,
                  onTap: () {},
                  iconData: Icons.logout,
                  label: "Log out",
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                Dashboard(),
                CurrentBookings(),
                Container(
                  color: Colors.yellow,
                ),
                ReportsScreen(),
                Container(
                  color: Colors.blue,
                ),
                ProfileScreen()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
