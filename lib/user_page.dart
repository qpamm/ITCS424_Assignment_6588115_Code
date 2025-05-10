import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  String _selectedLanguage = 'English';
  final List<String> _languages = ['English', 'Thai', 'Chinese'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/user.png'),
            ),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Personal Information",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            _inputField(
              controller: _nameController,
              icon: Icons.person,
              label: "Name",
            ),
            _inputField(
              controller: _emailController,
              icon: Icons.email,
              label: "Email",
            ),
            _inputField(
              controller: _mobileController,
              icon: Icons.phone,
              label: "Mobile",
            ),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.language, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Language',
                  labelStyle: const TextStyle(color: Colors.black),
                ),
                value: _selectedLanguage,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLanguage = newValue!;
                  });
                },
                items:
                    _languages.map((lang) {
                      return DropdownMenuItem(value: lang, child: Text(lang));
                    }).toList(),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "User: ${_nameController.text}, Language: $_selectedLanguage",
                      ),
                    ),
                  );
                },
                child: const Text("Log out"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    required IconData icon,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
