import 'package:flutter/material.dart';

class HospitalPage extends StatelessWidget {
  const HospitalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hospital")),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: SearchBar(
                leading: const Icon(Icons.search),
                hintText: 'Search',
                backgroundColor: MaterialStateProperty.all(Colors.grey[50]),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Hospital Near You",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Hospital Cards
            HospitalCard(
              imagePath: 'assets/images/Hospital/KKH.png',
              name: 'Khon Kaen Hospital',
              location: 'Khonkaen',
              waitTime: 'Wait 19 queues (~ 2 hrs.)',
              isDisabled: false,
            ),
            const SizedBox(height: 16),
            HospitalCard(
              imagePath: 'assets/images/Hospital/Srinagarind.png',
              name: 'Srinagarind Hospital',
              location: 'Mueng',
              waitTime: 'Wait 19 queues (~ 2 hrs.)',
              isDisabled: false,
            ),

            const SizedBox(height: 16),
            const Text(
              "Out of Area",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            HospitalCard(
              imagePath: 'assets/images/Hospital/Srinagarind.png',
              name: 'Srinagarind Hospital',
              location: 'Mueng',
              waitTime: 'Wait 19 queues (~ 2 hrs.)',
              isDisabled: true,
            ),
          ],
        ),
      ),
      )
    );
  }
}

class HospitalCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String location;
  final String waitTime;
  final bool isDisabled;

  const HospitalCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.location,
    required this.waitTime,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled
          ? () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  title: const Text(
                    "Out of Area",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  content: const Text(
                    "This hospital is outside your service area.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK", style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              );
            }
          : () => Navigator.pushNamed(context, '/hospitalselect'),
      child: Opacity(
        opacity: isDisabled ? 0.5 : 1, // Make it look disabled
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isDisabled ? Colors.grey.shade300 : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: isDisabled ? Colors.grey.shade400 : Colors.grey.shade100, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDisabled ? Colors.black45 : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: isDisabled ? Colors.grey.shade500 : Colors.teal.shade200,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: TextStyle(
                            color: isDisabled ? Colors.grey.shade500 : Colors.teal.shade200,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: isDisabled ? Colors.grey : Colors.grey.shade700,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          waitTime,
                          style: TextStyle(
                            color: isDisabled ? Colors.grey : Colors.grey.shade700,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
