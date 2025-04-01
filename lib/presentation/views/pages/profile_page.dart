import 'package:flutter/material.dart';
import 'package:papdaew_client/data/notifier.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Lali Rosh',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'standard',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF9C4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'UPGRADE TO VIP\n30%/month\npriority access, Convenient Reservations and more...',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.lock,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                 _buildListTile(context, 'Personal Data', onTap: () {
                  Navigator.of(context).pushNamed('/personaldata');
                }),
                _buildListTile(context, 'Favorites', onTap: () {
                  Navigator.of(context).pushNamed('/favorites');
                }),
                _buildListTile(context, 'Privacy and security', onTap: () {
                  Navigator.of(context).pushNamed('/privacysecurity');
                }),
                const Divider(),
                _buildListTile(context, 'Help Center', onTap: () {
                  Navigator.of(context).pushNamed('/helpcenter');
                }),
                _buildListTile(context, 'Contact us', onTap: () {
                  Navigator.of(context).pushNamed('/contactus');
                }),
                _buildListTile(context, 'Rate this app', onTap: () {
                  Navigator.of(context).pushNamed('/rateapp');
                }),
                  const Divider(),
                  _buildListTile(
                    context,
                    'Logout',
                    textColor: Colors.brown,
                    onTap: () {
                      Navigator.pushNamed(context, '/login'); // Keep this as a full navigation
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title,
      {Color? textColor, VoidCallback? onTap}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: textColor ?? Colors.black,
          fontWeight: title == 'Logout' ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}