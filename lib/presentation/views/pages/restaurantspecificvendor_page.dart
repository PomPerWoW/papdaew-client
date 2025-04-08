import 'package:flutter/material.dart';

class RestaurantSpecificVendorPage extends StatefulWidget {
  const RestaurantSpecificVendorPage({super.key});
  
  @override
  State<RestaurantSpecificVendorPage> createState() => _RestaurantSpecificVendorPageState();
}

class _RestaurantSpecificVendorPageState extends State<RestaurantSpecificVendorPage> {
  int selectedMinPersons = 1; // Start with minimum for 1-2
  int selectedMaxPersons = 2; // Start with maximum for 1-2
  int currentCount = 1; // Start with minimum for 1-2
  String? selectedRange = '1-2'; // Start with "1-2" as active

  void _updateRange(int minPersons, int maxPersons, String range) {
    setState(() {
      selectedMinPersons = minPersons;
      selectedMaxPersons = maxPersons;
      currentCount = minPersons; // Set to minimum when range is selected
      selectedRange = range; // Set the active range
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar-B-Q Plaza'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SpecificVendor(
              imagePath: 'assets/images/restaurant/bbqplaza.png',
              name: 'Bar-B-Q Plaza',
              location: 'Central World',
              waitTime: 'Wait 5 queues (~ 30 mins.)',
            ),
            SizedBox(height: 8),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 170,    
              child: TableNumber(
                onRangeSelected: _updateRange,
                selectedRange: selectedRange,
              ),
            ),
            SizedBox(height: 8),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: currentCount > selectedMinPersons
                            ? () {
                                setState(() {
                                  currentCount--;
                                });
                              }
                            : null,
                        icon: Icon(Icons.remove_circle_outline),
                        color: Colors.teal.shade200,
                        iconSize: 40,
                      ),
                      SizedBox(width: 24,),
                      Container(
                        width: 80,
                        alignment: Alignment.center,
                        child: Text(
                          '$currentCount',
                          style: TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 24,),
                      IconButton(
                        onPressed: currentCount < selectedMaxPersons || selectedMaxPersons == 0
                            ? () {
                                setState(() {
                                  currentCount++;
                                  if (selectedMaxPersons > 0 && currentCount > selectedMaxPersons) {
                                    // Show suggestion to switch range
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Exceeds range! Please select a larger table size.'),
                                        action: SnackBarAction(
                                          label: 'Switch',
                                          onPressed: () {
                                            if (currentCount <= 2) {
                                              _updateRange(1, 2, '1-2');
                                            } else if (currentCount <= 6) {
                                              _updateRange(3, 6, '3-6');
                                            } else {
                                              _updateRange(7, 15, '7+');
                                            }
                                          },
                                        ),
                                      ),
                                    );
                                  }
                                });
                              }
                            : null,
                        icon: Icon(Icons.add_circle_outline),
                        color: Colors.teal.shade200,
                        iconSize: 40,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    selectedMinPersons > 0
                        ? 'Selected range: $selectedMinPersons-$selectedMaxPersons'
                        : 'Select a table size or adjust manually',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF525252),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/restaurant');
                },
                child: Text(
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
}

class SpecificVendor extends StatelessWidget {
  final String imagePath;
  final String name;
  final String location;
  final String waitTime;

  const SpecificVendor({
    super.key,
    required this.imagePath,
    required this.name,
    required this.location,
    required this.waitTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: Colors.teal.shade200,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.teal.shade200,
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
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    waitTime,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TableNumber extends StatelessWidget {
  final Function(int, int, String) onRangeSelected;
  final String? selectedRange;

  const TableNumber({
    super.key,
    required this.onRangeSelected,
    required this.selectedRange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Table Size',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: 'Inter',
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTableOption(context, '1-2', 'Solo/Duo', Icons.person, 1, 2),
              _buildTableOption(context, '3-6', 'Small Group', Icons.group, 3, 6),
              _buildTableOption(context, '7+', 'Large Group', Icons.groups, 7, 15),
            ],
          ),
        ],
      );
    }

  Widget _buildTableOption( BuildContext context, String size, String label, IconData icon, int minPersons, int maxPersons,) {
    bool isSelected = selectedRange == size;
    return GestureDetector(
      onTap: () {
        onRangeSelected(minPersons, maxPersons, size);
      },
      child: Container(
        width: 90,
        height: 120,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.teal.shade200 : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.teal.shade50 : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: isSelected ? Colors.teal.shade400 : Colors.teal.shade200,
            ),
            SizedBox(height: 8),
            Text(
              size,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.teal.shade400 : Colors.black87,
              ),
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.teal.shade300 : Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}