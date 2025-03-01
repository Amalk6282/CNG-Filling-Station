import 'package:cng_filling_station/setting_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Sample data - in a real app, you would fetch this from your backend
  Map<String, dynamic> stationData = {
    "name": "Green CNG Station",
    "address": "123 Energy Lane, Gas City",
    "contactNumber": "+1 234-567-8900",
    "email": "contact@greencng.com",
    "operatingHours": "6:00 AM - 10:00 PM",
    "totalPumps": 8,
    "registrationDate": "Jan 15, 2023",
    "rating": 4.7,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileHeader(),
              const SizedBox(height: 24),
              _buildInfoSection("Station Details"),
              _buildInfoCard(),
              const SizedBox(height: 20),
              _buildActionButtons(),
              const SizedBox(height: 20),
              _buildAnalyticsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Center(
      child: Column(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Icon(
              Icons.local_gas_station,
              size: 70,
              color: Colors.green.shade800,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            stationData["name"],
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.amber, size: 20),
              const SizedBox(width: 4),
              Text(
                "${stationData["rating"]} / 5.0",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoRow(Icons.location_on, "Address", stationData["address"]),
            const Divider(),
            _buildInfoRow(Icons.phone, "Contact", stationData["contactNumber"]),
            const Divider(),
            _buildInfoRow(Icons.email, "Email", stationData["email"]),
            const Divider(),
            _buildInfoRow(
                Icons.access_time, "Hours", stationData["operatingHours"]),
            const Divider(),
            _buildInfoRow(Icons.local_gas_station, "Total Pumps",
                "${stationData["totalPumps"]}"),
            const Divider(),
            _buildInfoRow(Icons.calendar_today, "Registration",
                stationData["registrationDate"]),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _showEditProfileDialog(context),
            icon: const Icon(Icons.edit),
            label: const Text("Edit Profile"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
            icon: const Icon(Icons.settings),
            label: const Text("Settings"),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 12),
              side: const BorderSide(color: Colors.green),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAnalyticsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoSection("Quick Analytics"),
        Row(
          children: [
            Expanded(
              child: _buildAnalyticsCard(
                  "Total Bookings", "543", Icons.book_online),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildAnalyticsCard(
                  "Revenue", "₹87,542", Icons.currency_rupee),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildAnalyticsCard("Daily Avg", "32", Icons.trending_up),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildAnalyticsCard(
                  "Capacity", "87%", Icons.battery_charging_full),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAnalyticsCard(String title, String value, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: Colors.green, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    // Controllers for text fields with initial values
    final nameController = TextEditingController(text: stationData["name"]);
    final addressController =
        TextEditingController(text: stationData["address"]);
    final contactController =
        TextEditingController(text: stationData["contactNumber"]);
    final emailController = TextEditingController(text: stationData["email"]);
    final hoursController =
        TextEditingController(text: stationData["operatingHours"]);
    final pumpsController =
        TextEditingController(text: stationData["totalPumps"].toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Edit Profile",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField(
                  controller: nameController,
                  label: "Station Name",
                  icon: Icons.business,
                ),
                _buildTextField(
                  controller: addressController,
                  label: "Address",
                  icon: Icons.location_on,
                ),
                _buildTextField(
                  controller: contactController,
                  label: "Contact Number",
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
                _buildTextField(
                  controller: emailController,
                  label: "Email",
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                _buildTextField(
                  controller: hoursController,
                  label: "Operating Hours",
                  icon: Icons.access_time,
                ),
                _buildTextField(
                  controller: pumpsController,
                  label: "Total Pumps",
                  icon: Icons.local_gas_station,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Update the station data
                setState(() {
                  stationData["name"] = nameController.text;
                  stationData["address"] = addressController.text;
                  stationData["contactNumber"] = contactController.text;
                  stationData["email"] = emailController.text;
                  stationData["operatingHours"] = hoursController.text;
                  stationData["totalPumps"] =
                      int.tryParse(pumpsController.text) ??
                          stationData["totalPumps"];
                });

                // Close the dialog
                Navigator.of(context).pop();

                // Show a success message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Profile updated successfully"),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text("Save"),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
          actionsPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.green),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.green, width: 2),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
