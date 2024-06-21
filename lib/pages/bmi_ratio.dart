import 'package:flutter/material.dart';

class BMIInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'BMI Categories:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildBMIInfoRow('Underweight', 'Below 18.5'),
            _buildBMIInfoRow('Normal weight', '18.5 - 24.9'),
            _buildBMIInfoRow('Overweight', '25 - 29.9'),
            _buildBMIInfoRow('Obesity', '30 and above'),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Text(
                  'This App Created by the Group of people in NEMSU main Campus Tandag.',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Leader: Richard T. Banguiz',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text('Members:'),
                Text('Angelou Fuentes'),
                Text('Christian Alabat'),
                Text('Mico Gungob'),
                Text('Genevive Guiral'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBMIInfoRow(String category, String range) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              category,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(range),
          ),
        ],
      ),
    );
  }
}
