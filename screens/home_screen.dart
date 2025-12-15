// import 'package:flutter/material.dart';
// import '../models/user_model.dart';

// class HomeScreen extends StatelessWidget {
//   final dynamic user; // รับ User object จากหน้า Login

//   const HomeScreen({super.key, this.user});

//   @override
//   Widget build(BuildContext context) {
//     // ดึงข้อมูลจาก User object
//     final userName = user is User ? user.name : 'Guest';
//     final userEmail = user is User ? user.email : 'No email';

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('หน้าหลัก'),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         automaticallyImplyLeading: false, // ซ่อนปุ่มย้อนกลับ
//         actions: [
//           // ปุ่ม Logout
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () => _showLogoutDialog(context),
//           ),
//         ],
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Avatar
//               const CircleAvatar(
//                 radius: 60,
//                 backgroundColor: Colors.indigo,
//                 child: Icon(Icons.person, size: 60, color: Colors.white),
//               ),
//               const SizedBox(height: 24),

//               // แสดงข้อมูล User
//               Text(
//                 'ยินดีต้อนรับ!',
//                 style: Theme.of(context).textTheme.headlineSmall,
//               ),
//               const SizedBox(height: 8),

//               // Card แสดงข้อมูล
//               Card(
//                 elevation: 4,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       ListTile(
//                         leading: const Icon(Icons.person, color: Colors.indigo),
//                         title: const Text('ชื่อ'),
//                         subtitle: Text(userName),
//                       ),
//                       const Divider(),
//                       ListTile(
//                         leading: const Icon(Icons.email, color: Colors.indigo),
//                         title: const Text('อีเมล'),
//                         subtitle: Text(userEmail),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 32),

//               // ปุ่ม Logout
//               SizedBox(
//                 width: double.infinity,
//                 child: OutlinedButton.icon(
//                   onPressed: () => _showLogoutDialog(context),
//                   icon: const Icon(Icons.logout),
//                   label: const Text('ออกจากระบบ'),
//                   style: OutlinedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     foregroundColor: Colors.red,
//                     side: const BorderSide(color: Colors.red),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // แสดง Dialog ยืนยันการ Logout
//   void _showLogoutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('ยืนยันการออกจากระบบ'),
//         content: const Text('คุณต้องการออกจากระบบใช่หรือไม่?'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context), // ปิด Dialog
//             child: const Text('ยกเลิก'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context); // ปิด Dialog
//               // กลับไปหน้า Login และล้าง stack ทั้งหมด
//               Navigator.pushNamedAndRemoveUntil(
//                 context,
//                 '/login',
//                 (route) => false, // ลบทุก route ใน stack
//               );
//             },
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//             child: const Text('ออกจากระบบ'),
//           ),
//         ],
//       ),
//     );
//   }
// }

//2
// import 'package:flutter/material.dart';
// import 'profile_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int index = 0;

//   final pages = [
//     const Center(child: Text('🏠 Home')),
//     const ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home')),
//       body: pages[index],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: index,
//         onTap: (i) => setState(() => index = i),
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

//2
// import 'package:flutter/material.dart';
// import '../models/user_model.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final user = ModalRoute.of(context)!.settings.arguments as UserModel;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () {
//               Navigator.pushNamedAndRemoveUntil(
//                 context,
//                 '/login',
//                 (route) => false,
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Hello, ${user.name}', style: const TextStyle(fontSize: 24)),
//             const SizedBox(height: 10),
//             Text(user.email, style: const TextStyle(color: Colors.grey)),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'profile_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      Center(child: Text("Hello ${widget.user.name} 👋")),
      ProfileScreen(user: widget.user),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (_) => false,
              );
            },
          ),
        ],
      ),
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
