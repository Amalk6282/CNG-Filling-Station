import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Settings state
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  bool autoAcceptBookings = false;
  String language = 'English';
  double cylinderThreshold = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader("Account Settings"),
              _buildAccountSettings(),
              const SizedBox(height: 24),
              
              _buildSectionHeader("App Preferences"),
              _buildAppPreferences(),
              const SizedBox(height: 24),
              
              _buildSectionHeader("Booking Settings"),
              _buildBookingSettings(),
              const SizedBox(height: 24),
              
              _buildSectionHeader("Notifications"),
              _buildNotificationSettings(),
              const SizedBox(height: 24),
              
              _buildActionButtons(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
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

  Widget _buildAccountSettings() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSettingsTile(
              icon: Icons.password,
              title: "Change Password",
              subtitle: "Update your account password",
              onTap: () {
                _showChangePasswordDialog(context);
              },
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
            const Divider(),
            _buildSettingsTile(
              icon: Icons.language,
              title: "Language",
              subtitle: language,
              onTap: () {
                _showLanguageDialog(context);
              },
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppPreferences() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSwitchTile(
              icon: Icons.dark_mode,
              title: "Dark Mode",
              subtitle: "Enable dark theme for the app",
              value: darkModeEnabled,
              onChanged: (value) {
                setState(() {
                  darkModeEnabled = value;
                });
              },
            ),
            const Divider(),
            _buildSettingsTile(
              icon: Icons.data_usage,
              title: "Clear Cache",
              subtitle: "Free up storage space",
              onTap: () {
                _showClearCacheDialog(context);
              },
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingSettings() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSwitchTile(
              icon: Icons.auto_awesome,
              title: "Auto-accept Bookings",
              subtitle: "Automatically accept new booking requests",
              value: autoAcceptBookings,
              onChanged: (value) {
                setState(() {
                  autoAcceptBookings = value;
                });
              },
            ),
            const Divider(),
            _buildSliderTile(
              icon: Icons.warning_amber_rounded,
              title: "Low Cylinder Alert",
              subtitle: "Alert when cylinder capacity falls below ${cylinderThreshold.toInt()}%",
              value: cylinderThreshold,
              min: 5.0,
              max: 50.0,
              onChanged: (value) {
                setState(() {
                  cylinderThreshold = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationSettings() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSwitchTile(
              icon: Icons.notifications_active,
              title: "Push Notifications",
              subtitle: "Receive alerts for new bookings and updates",
              value: notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),
            if (notificationsEnabled) ...[
              const Divider(),
              _buildSettingsTile(
                icon: Icons.schedule,
                title: "Quiet Hours",
                subtitle: "Set times when notifications are silenced",
                onTap: () {
                  // Open quiet hours settings
                },
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Widget? trailing,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.green),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 14,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.green),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 14,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.green,
      ),
    );
  }

  Widget _buildSliderTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.green),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
          child: Row(
            children: [
              Text("${min.toInt()}%", style: TextStyle(color: Colors.grey.shade600)),
              Expanded(
                child: Slider(
                  value: value,
                  min: min,
                  max: max,
                  divisions: ((max - min) / 5).floor(),
                  label: value.toInt().toString() + "%",
                  onChanged: onChanged,
                  activeColor: Colors.green,
                ),
              ),
              Text("${max.toInt()}%", style: TextStyle(color: Colors.grey.shade600)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // Save settings
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Settings saved successfully"),
                backgroundColor: Colors.green,
              ),
            );
          },
          icon: const Icon(Icons.save),
          label: const Text("Save Settings"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () {
            _showResetSettingsDialog(context);
          },
          icon: const Icon(Icons.refresh),
          label: const Text("Reset to Default"),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  // Dialog methods
  void _showChangePasswordDialog(BuildContext context) {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Change Password",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildPasswordField(
                  controller: currentPasswordController,
                  label: "Current Password",
                  icon: Icons.lock_outline,
                ),
                _buildPasswordField(
                  controller: newPasswordController,
                  label: "New Password",
                  icon: Icons.lock,
                ),
                _buildPasswordField(
                  controller: confirmPasswordController,
                  label: "Confirm New Password",
                  icon: Icons.lock_reset,
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
                // Password validation logic would go here
                Navigator.of(context).pop();
                
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Password updated successfully"),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text("Update"),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }

  void _showLanguageDialog(BuildContext context) {
    final languages = ['English', 'Hindi', 'Gujarati', 'Tamil', 'Telugu', 'Marathi'];
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Select Language",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: languages.map((lang) => 
                RadioListTile<String>(
                  title: Text(lang),
                  value: lang,
                  groupValue: language,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      language = value!;
                      Navigator.of(context).pop();
                    });
                  },
                )
              ).toList(),
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
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }

  void _showClearCacheDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Clear Cache",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            "This will clear all temporary files. Your settings and account information will not be affected."
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
                Navigator.of(context).pop();
                
                // Show loading indicator
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    );
                  },
                );
                
                // Simulate clearing cache
                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.of(context).pop(); // Close loading dialog
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Cache cleared successfully"),
                      backgroundColor: Colors.green,
                    ),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text("Clear"),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }

  void _showResetSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Reset Settings",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            "This will reset all settings to their default values. Are you sure you want to continue?"
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
                setState(() {
                  // Reset to defaults
                  notificationsEnabled = true;
                  darkModeEnabled = false;
                  autoAcceptBookings = false;
                  language = 'English';
                  cylinderThreshold = 20.0;
                });
                
                Navigator.of(context).pop();
                
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Settings reset to default"),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text("Reset"),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        obscureText: true,
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
        ),
      ),
    );
  }
}