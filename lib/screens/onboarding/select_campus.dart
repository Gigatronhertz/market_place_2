import 'package:flutter/material.dart';
import 'package:market_place_2/globals/customaizables.dart';
import 'package:market_place_2/globals/squarebutton.dart';
import 'package:market_place_2/screens/product_screens/product_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectCampus extends StatefulWidget {
  const SelectCampus({super.key});

  @override
  State<SelectCampus> createState() => _SelectCampusState();
}

class _SelectCampusState extends State<SelectCampus> {
  final List<String> _campuses = [
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

    // Add more campuses as needed
  ];

  String? _selectedCampus;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadSelectedCampus();
  }

  // Load the selected campus from shared preferences
  Future<void> _loadSelectedCampus() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedCampus = _prefs.getString('selectedCampus');
    });
  }

  // Save the selected campus to shared preferences
  Future<void> _saveSelectedCampus(String campus) async {
    await _prefs.setString('selectedCampus', campus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Campus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Select your campus:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedCampus,
                hint: Text('Choose a campus'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCampus = newValue;
                  });
                  if (newValue != null) {
                    _saveSelectedCampus(newValue);
                  }
                },
                items: _campuses.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.green[50],
                ),
              ),
              Expanded(child: SizedBox(height: 20)),
              Container(
                height: 50,
                child: InkWell(
                  onTap: _selectedCampus == null
                      ? null
                      : () {
                          // Handle the selection
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('You selected $_selectedCampus')),
                          );

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductPage(),
                              ));
                        },
                  child: RoundedButton(
                      buttonText: Text(
                        "Verify",
                        style: greenbtntext,
                      ),
                      color: Colors.green,
                      height: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SelectCampus(),
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
  ));
}
