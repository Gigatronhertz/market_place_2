import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:market_place_2/globals/auth_button.dart';
import 'package:market_place_2/globals/checkboxwidget.dart';
import 'package:market_place_2/globals/customaizables.dart';
import 'package:market_place_2/globals/text_input_widget.dart';
import 'package:market_place_2/globals/sliderWidget.dart';
import 'package:market_place_2/globals/squarebutton.dart';
import 'package:market_place_2/screens/auth_screens/otpscreen.dart';
import 'package:market_place_2/screens/auth_screens/sign_up2.dart';
import 'package:market_place_2/screens/onboarding/onboardin1.dart';
import 'package:market_place_2/screens/product_screens/product_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // Gender options
  List<String> gender = ["Male", "Female"];

  // Campus options
  List<String> campus = [
    'University of Lagos',
    'Obafemi Awolowo University',
    'University of Nigeria, Nsukka',
    'University of Ibadan',
    'Ahmadu Bello University',
    'Covenant University',
    'Federal University of Technology, Akure',
    'University of Benin',
    'Lagos State University',
    'University of Ilorin',
  ];

  // SharedPreferences instances
  late SharedPreferences _prefs;
  late SharedPreferences _campusprefs;

  // Selected values
  String? _selectedGender;
  String? _selectedCampus;

  @override
  void initState() {
    super.initState();
    // Load saved gender and campus from SharedPreferences
    _loadSelectedGender();
    _loadSelectedCampus();
  }

  // Load selected gender from SharedPreferences
  Future<void> _loadSelectedGender() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedGender = _prefs.getString('selectedgender');
    });
  }

  // Load selected campus from SharedPreferences
  Future<void> _loadSelectedCampus() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedCampus = _prefs.getString('selectedcampus');
    });
  }

  // Save selected gender to SharedPreferences
  Future<void> _saveSelectedGender(String gender) async {
    await _prefs.setString('selectedgender', gender);
  }

  // Save selected campus to SharedPreferences
  Future<void> _saveSelectedCampus(String campus) async {
    await _prefs.setString('selectedcampus', campus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(15),
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            Row(
              children: [
                Icon(Icons.arrow_back_ios_new),
                SizedBox(width: 20),
                Text(
                  "Edit profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage("assets/images/personplaceholder.png"),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Icon(
                      Icons.mode_edit_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
            textfeild(title: "Name", helpertxt: "John Doe", icon: Icons.person),
            textfeild(
                title: "Email",
                helpertxt: "Jh********@gmail.com",
                icon: Icons.email),
            textfeild(
                title: "Phone Number",
                helpertxt: "088******4",
                icon: Icons.phone),
            // Gender selection dropdown
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text("Sex", style: onboardsmall),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              decoration: BoxDecoration(
                color: lightgreen1,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonFormField<String>(
                value: _selectedGender,
                hint: Text('Choose a gender'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue;
                  });
                  if (newValue != null) {
                    _saveSelectedGender(newValue);
                  }
                },
                items: gender.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            // Campus selection dropdown
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text("Campus", style: onboardsmall),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              decoration: BoxDecoration(
                color: lightgreen1,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonFormField<String>(
                value: _selectedCampus,
                hint: Text('Choose your campus'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCampus = newValue;
                  });
                  if (newValue != null) {
                    _saveSelectedCampus(newValue);
                  }
                },
                items: campus.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Expanded(
                child:
                    SizedBox(height: MediaQuery.of(context).size.height / 2)),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
              },
              child: Container(
                height: 50,
                child: RoundedButton(
                  buttonText: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  height: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
