import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isNepali = false;
  bool showAllMenus = false;

  // Menu options
  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.play_circle_fill, 'label': 'Videos'},
    {'icon': Icons.article, 'label': 'News'},
    {'icon': Icons.event, 'label': 'Events'},
    {'icon': Icons.local_fire_department, 'label': 'Ignite'},
    {'icon': Icons.quiz, 'label': 'Quiz'},
    {'icon': Icons.poll, 'label': 'Polls'},
    {'icon': Icons.calculate, 'label': 'Calculators'},
    {'icon': Icons.code, 'label': 'Decode'},
    {'icon': Icons.description, 'label': 'Docs'},
  ];

  @override
  Widget build(BuildContext context) {
    final skyBlue = const Color(0xFF87CEEB); // Sky blue color code

    return Scaffold(
      backgroundColor: Colors.grey[100],

      // ✅ Top App Bar
      appBar: AppBar(
        backgroundColor: skyBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Menu clicked")));
          },
        ),
        title: Text(
          isNepali ? 'ई-बिजनेस नेपाल' : 'E-Business Nepal',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              isNepali ? Icons.translate : Icons.language,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                isNepali = !isNepali;
              });
            },
          ),
        ],
      ),

      // ✅ Body
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                isNepali
                    ? 'तपाईंको यात्रा सुरु गर्नुहोस्'
                    : 'Start your journey',
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Journey Started 🚀")),
                );
              },
              icon: const Text("🚀", style: TextStyle(fontSize: 22)),
              label: Text(
                isNepali ? 'सुरु गर्नुहोस्' : 'Get Started',
                style: const TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: skyBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),

      // ✅ Footer Navigation Bar
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: showAllMenus ? 220 : 80,
        decoration: BoxDecoration(
          color: skyBlue,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: showAllMenus ? menuItems.length : 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: showAllMenus ? 5 : 4,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${item['label']} clicked")),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item['icon'], color: Colors.white, size: 28),
                        const SizedBox(height: 4),
                        Text(
                          isNepali
                              ? _translateToNepali(item['label'])
                              : item['label'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Expand/Collapse button
            InkWell(
              onTap: () {
                setState(() {
                  showAllMenus = !showAllMenus;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  showAllMenus ? Icons.expand_more : Icons.expand_less,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Simple Nepali translations for menu items
  String _translateToNepali(String label) {
    switch (label) {
      case 'Home':
        return 'गृह';
      case 'Videos':
        return 'भिडियो';
      case 'News':
        return 'समाचार';
      case 'Events':
        return 'कार्यक्रम';
      case 'Ignite':
        return 'इग्नाइट';
      case 'Quiz':
        return 'प्रश्नोत्तर';
      case 'Polls':
        return 'मतदान';
      case 'Calculators':
        return 'क्यालकुलेटर';
      case 'Decode':
        return 'डिकोड';
      case 'Docs':
        return 'डक्स';
      default:
        return label;
    }
  }
}
