import 'package:flutter/material.dart';

void main() {
  runApp(const SkillPathApp());
}

class SkillPathApp extends StatelessWidget {
  const SkillPathApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkillPath',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/programs': (context) => const ProgramListingScreen(),
      },
    );
  }
}

// ---------------- LOGIN SCREEN ----------------

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),

              Center(
                child: Column(
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2563EB),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.school_rounded,
                        color: Colors.white,
                        size: 38,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'SkillPath',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Discover opportunities. Build your future.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 45),

              const Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Create a new account'),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- HOME SCREEN ----------------

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SkillPath',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, Learner',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Find opportunities that match your goals.',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 24),

            TextField(
              onTap: () {
                Navigator.pushNamed(context, '/programs');
              },
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Search opportunities',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Explore Categories',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                _categoryCard(
                  context,
                  Icons.code,
                  'Technology',
                ),
                const SizedBox(width: 12),
                _categoryCard(
                  context,
                  Icons.business_center_outlined,
                  'Business',
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                _categoryCard(
                  context,
                  Icons.volunteer_activism_outlined,
                  'Volunteering',
                ),
                const SizedBox(width: 12),
                _categoryCard(
                  context,
                  Icons.menu_book_outlined,
                  'Courses',
                ),
              ],
            ),

            const SizedBox(height: 28),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recommended',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/programs');
                  },
                  child: const Text('View all'),
                ),
              ],
            ),

            const SizedBox(height: 10),

            _programCard(
              context,
              'Flutter Development Bootcamp',
              'Technology',
              'Online',
            ),

            _programCard(
              context,
              'Digital Marketing Workshop',
              'Marketing',
              'Online',
            ),
          ],
        ),
      ),

      bottomNavigationBar: _bottomNav(context, 0),
    );
  }

  Widget _categoryCard(
    BuildContext context,
    IconData icon,
    String title,
  ) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/programs');
        },
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 30,
                color: const Color(0xFF2563EB),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- PROGRAM LISTING ----------------

class ProgramListingScreen extends StatelessWidget {
  const ProgramListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Programs',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search programs',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                FilterChip(
                  label: const Text('All'),
                  selected: true,
                  onSelected: (_) {},
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Courses'),
                  onSelected: (_) {},
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Workshops'),
                  onSelected: (_) {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _listingCard(
                  context,
                  'Flutter Development Bootcamp',
                  'Technology',
                  'Online',
                  'Learn Flutter and build modern mobile applications.',
                ),
                _listingCard(
                  context,
                  'Digital Marketing Workshop',
                  'Marketing',
                  'Online',
                  'Learn practical digital marketing strategies.',
                ),
                _listingCard(
                  context,
                  'Business Analytics Course',
                  'Business',
                  'Hybrid',
                  'Develop skills in data analysis and business decision-making.',
                ),
                _listingCard(
                  context,
                  'Community Volunteering Program',
                  'Volunteering',
                  'On-site',
                  'Gain experience while contributing to your community.',
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: _bottomNav(context, 1),
    );
  }

  Widget _listingCard(
    BuildContext context,
    String title,
    String category,
    String mode,
    String description,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Chip(label: Text(category)),
                const SizedBox(width: 8),
                Text(
                  mode,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProgramDetailsScreen(
                        title: title,
                        category: category,
                        mode: mode,
                        description: description,
                      ),
                    ),
                  );
                },
                child: const Text('View Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- PROGRAM DETAILS ----------------

class ProgramDetailsScreen extends StatelessWidget {
  final String title;
  final String category;
  final String mode;
  final String description;

  const ProgramDetailsScreen({
    super.key,
    required this.title,
    required this.category,
    required this.mode,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Program Details'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FE),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(
                Icons.school_outlined,
                size: 70,
                color: Color(0xFF2563EB),
              ),
            ),

            const SizedBox(height: 22),

            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Chip(label: Text(category)),
                const SizedBox(width: 8),
                Chip(label: Text(mode)),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'About this program',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              description,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'What you will learn',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const _LearningPoint(
              text: 'Practical skills and real-world experience',
            ),
            const _LearningPoint(
              text: 'Industry-relevant knowledge',
            ),
            const _LearningPoint(
              text: 'Project-based learning',
            ),
            const _LearningPoint(
              text: 'Career development opportunities',
            ),

            const SizedBox(height: 28),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Apply Now',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border),
                label: const Text('Save Program'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LearningPoint extends StatelessWidget {
  final String text;

  const _LearningPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Color(0xFF2563EB),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

// ---------------- SHARED NAVIGATION ----------------

Widget _bottomNav(BuildContext context, int selectedIndex) {
  return NavigationBar(
    selectedIndex: selectedIndex,
    onDestinationSelected: (index) {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/programs');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile screen will be added in a later phase.'),
          ),
        );
      }
    },
    destinations: const [
      NavigationDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: 'Home',
      ),
      NavigationDestination(
        icon: Icon(Icons.explore_outlined),
        selectedIcon: Icon(Icons.explore),
        label: 'Programs',
      ),
      NavigationDestination(
        icon: Icon(Icons.person_outline),
        selectedIcon: Icon(Icons.person),
        label: 'Profile',
      ),
    ],
  );
}

Widget _programCard(
  BuildContext context,
  String title,
  String category,
  String mode,
) {
  return Card(
    margin: const EdgeInsets.only(bottom: 12),
    elevation: 0,
    child: ListTile(
      contentPadding: const EdgeInsets.all(12),
      leading: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: const Color(0xFFE8F0FE),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.school_outlined,
          color: Color(0xFF2563EB),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('$category • $mode'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProgramDetailsScreen(
              title: title,
              category: category,
              mode: mode,
              description:
                  'This program provides learners with practical knowledge, relevant skills, and opportunities for professional development.',
            ),
          ),
        );
      },
    ),
  );
}