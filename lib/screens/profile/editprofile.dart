import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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

class editprofile extends StatefulWidget {
  const editprofile({super.key});

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  List<String> gender = ["Male", "Female"];

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

  late SharedPreferences _prefs;
  late SharedPreferences _campusprefs;

  @override
  void initState() {
    super.initState();
    _loadselectedgender();
  }

  String? _selectedGender;
  String? _selectedcampus;
  Future<void> _loadselectedgender() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedGender = _prefs.getString('selectedgender');
    });
  }

  Future<void> _loadselectedcampus() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedGender = _prefs.getString('selectedgender');
    });
  }

  // Save the selected gender to shared preferences
  Future<void> _saveselectedgender(String gender) async {
    await _prefs.setString('selectedgender', gender);
  }

  Future<void> _saveselectedcampus(String gender) async {
    await _prefs.setString('selectedgender', gender);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(15),
        color: Colors.white, // Assuming 'white' is defined elsewhere
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Row(
              children: [
                Container(
                  child: Icon(Icons.arrow_back_ios_new),
                ),
                SizedBox(width: 20),
                Container(
                  child: Text(
                    "Edit profile",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight
                            .bold), // Assuming 'topskip' is defined elsewhere
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Stack(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage("assets/images/personplaceholder.png")),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors
                              .green, // Assuming 'green' is defined elsewhere
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Icon(
                        Icons.mode_edit_outlined,
                        color: Colors
                            .white, // Assuming 'white' is defined elsewhere
                        size: 15,
                      )),
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
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Text(
                "Sex",
                style: onboardsmall,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, top: 3, bottom: 3, right: 15),
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
                      _saveselectedgender(newValue);
                    }
                  },
                  items: gender.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(border: InputBorder.none)),
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(),
                    ));
              },
              child: Container(
                height: 50,
                child: RoundedButton(
                    buttonText: Text(
                      "Save",
                      style: TextStyle(
                          color: Colors
                              .white), // Assuming 'greenbtntext' is defined elsewhere
                    ),
                    color:
                        Colors.green, // Assuming 'green' is defined elsewhere
                    height: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
