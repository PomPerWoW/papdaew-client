import 'package:flutter/material.dart';

class PrivacySecurityPage extends StatelessWidget {
  const PrivacySecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy & Security',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Inter",
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF6B9080)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy Settings',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter",
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Control your account security',
              style: TextStyle(
                color: Color(0xFF555555),
                fontSize: 12,
                fontFamily: "Inter",
              ),
            ),
            const SizedBox(height: 24),
            _buildSwitchTile(
              title: 'Two-Factor Authentication',
              value: false,
              onChanged: (value) {},
            ),
            const Divider(),
            _buildSwitchTile(
              title: 'Share Location',
              value: true,
              onChanged: (value) {},
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Change Password',
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B9080),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            const Divider(),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6B9080),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Save Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "Inter",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      trailing: Switch(
        value: value,
        activeColor: const Color(0xFF6B9080),
        onChanged: onChanged,
      ),
    );
  }
}