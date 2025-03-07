import 'package:flutter/material.dart';

class HospitalSelectPage extends StatefulWidget {
  const HospitalSelectPage({super.key});

  @override
  _HospitalSelectPageState createState() => _HospitalSelectPageState();
}

class _HospitalSelectPageState extends State<HospitalSelectPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();

  String? selectedDepartment;
  String? selectedDateTime;

  final List<String> departments = ['General Medicine', 'Pediatrics', 'Orthopedics'];
  final List<String> availableDateTime = ['March 6, 10:00 AM', 'March 7, 2:00 PM', 'March 8, 4:00 PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hospital Info
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Hospital/KKH.png'),
                  radius: 30,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Khokaen Hospital',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Remaining queues: 3',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.green),
                        SizedBox(width: 4),
                        Text('Robinson Ladkrabang', style: TextStyle(color: Colors.green)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.grey, thickness: 1),
            const SizedBox(height: 20),

            // Input Fields with Controlled Height
            // buildTextField('First Name', firstNameController),
            // buildTextField('Last Name', lastNameController),
            // buildTextField('Identification Number', idNumberController),

            // Dropdown Fields
            buildDropdownField('Department', departments, (String? newValue) {
              setState(() {
                selectedDepartment = newValue;
              });
            }),
            buildDropdownField('Date and Time', availableDateTime, (String? newValue) {
              setState(() {
                selectedDateTime = newValue;
              });
            }),

            const SizedBox(height: 10),
            const Text(
              'Please arrive before reserved 30 minutes',
              style: TextStyle(color: Colors.red),
            ),

            const Spacer(),

            // Reserve Button
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF525252),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Handle reservation logic here
                },
                child: const Text(
                  'Reserve',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        // SizedBox(
        //   height: 40, // Adjust height here
        //   child: TextField(
        //     controller: controller,
        //     style: const TextStyle(fontSize: 14), // Smaller font
        //     decoration: InputDecoration(
        //       contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12), // Adjust padding
        //       filled: true,
        //       fillColor: Colors.grey[200],
        //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //       hintText: 'Enter $label',
        //     ),
        //   ),
        // ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buildDropdownField(String label, List<String> options, ValueChanged<String?>? onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 40, // Match height with text fields
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            items: options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option, style: const TextStyle(fontSize: 14)), // Smaller font
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
