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

class EditStore extends StatefulWidget {
  const EditStore({super.key});

  @override
  State<EditStore> createState() => _EditStoreState();
}

class _EditStoreState extends State<EditStore> {
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
  String? _selectedCampus;

  @override
  void initState() {
    super.initState();
    // Load saved campus from SharedPreferences
    _loadSelectedCampus();
  }

  // Load selected campus from SharedPreferences
  Future<void> _loadSelectedCampus() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedCampus = _prefs.getString('selectedcampus');
    });
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
                  "Edit Store Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            GestureDetector(
              onTap: () {
                // Handle image selection here
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.store, size: 50, color: Colors.grey),
              ),
            ),
            textfeild(
                title: "Store Name",
                helpertxt: "Your Store Name",
                icon: Icons.store),
            textfeild(
                title: "Store Description",
                helpertxt: "Describe your store",
                icon: Icons.description),
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
