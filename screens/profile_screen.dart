//1 import 'package:flutter/material.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final _formKey = GlobalKey<FormState>();

//   final nameCtrl = TextEditingController(text: 'User');
//   final phoneCtrl = TextEditingController(text: '0123456789');

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Form(
//         key: _formKey,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         child: Column(
//           children: [
//             TextFormField(
//               controller: nameCtrl,
//               decoration: const InputDecoration(
//                 labelText: 'Name',
//                 prefixIcon: Icon(Icons.person),
//               ),
//               validator: (v) => v == null || v.isEmpty ? 'กรุณากรอกชื่อ' : null,
//             ),

//             TextFormField(
//               controller: phoneCtrl,
//               decoration: const InputDecoration(
//                 labelText: 'Phone',
//                 prefixIcon: Icon(Icons.phone),
//               ),
//               validator: (v) {
//                 if (!RegExp(r'^0\d{9}$').hasMatch(v ?? '')) {
//                   return 'เบอร์ไม่ถูกต้อง';
//                 }
//                 return null;
//               },
//             ),

//             const SizedBox(height: 20),

//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   ScaffoldMessenger.of(
//                     context,
//                   ).showSnackBar(const SnackBar(content: Text('บันทึกสำเร็จ')));
//                 }
//               },
//               child: const Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//3
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  final UserModel user;
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController nameCtrl;
  late TextEditingController phoneCtrl;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.user.name);
    phoneCtrl = TextEditingController(text: widget.user.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: nameCtrl,
            decoration: const InputDecoration(labelText: "Name"),
          ),
          TextField(
            controller: phoneCtrl,
            decoration: const InputDecoration(labelText: "Phone"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                widget.user.name = nameCtrl.text;
                widget.user.phone = phoneCtrl.text;
              });
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Profile updated")));
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
