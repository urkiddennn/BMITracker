import 'package:bmi_tracker/pages/bmi_ratio.dart';
import 'package:flutter/material.dart';
import 'user.dart';
import 'storage_service.dart';
import 'edit_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({required this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  double _weight = 0;
  double _height = 0;
  double _bmi = 0;
  int _age = 0;
  String _bmiResult = '';
  final StorageService _storageService = StorageService();

  void _calculateBMI() {
    setState(() {
      _bmi = _weight / ((_height / 100) * (_height / 100));
      if (_bmi < 18.5) {
        _bmiResult = 'Underweight';
      } else if (_bmi < 24.9) {
        _bmiResult = 'Normal weight';
      } else if (_bmi < 29.9) {
        _bmiResult = 'Overweight';
      } else {
        _bmiResult = 'Obesity';
      }

      String currentDate = DateTime.now().toIso8601String();
      BMIRecord newRecord = BMIRecord(
        weight: _weight,
        height: _height,
        bmi: _bmi,
        date: currentDate,
        age: _age,
      );
      widget.user.bmiRecords.add(newRecord);
      _storageService.writeUsers([widget.user]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Home Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.person_2_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditProfileScreen(user: widget.user)),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BMIInfoScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Weight (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your weight';
                  }
                  return null;
                },
                onSaved: (value) {
                  _weight = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Height (cm)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your height';
                  }
                  return null;
                },
                onSaved: (value) {
                  _height = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
                onSaved: (value) {
                  _age = int.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _calculateBMI();
                  }
                },
                child: Text('Calculate BMI'),
              ),
              SizedBox(height: 20),
              Text(
                _bmi == 0
                    ? ''
                    : 'Your BMI is ${_bmi.toStringAsFixed(2)} ($_bmiResult)',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.user.bmiRecords.length,
                  itemBuilder: (context, index) {
                    BMIRecord record = widget.user.bmiRecords[index];
                    return Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 3)),
                      child: ListTile(
                        title: Text(
                          'BMI: ${record.bmi.toStringAsFixed(2)}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle:
                            Text('Date: ${record.date}, Age: ${record.age}'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
