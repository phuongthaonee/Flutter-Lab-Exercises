import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final Color resultColor;
  final String interpretation;

  const ResultPage({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.resultColor,
    required this.interpretation,
  });

  Widget _buildBMIRangeIndicator() {
    double bmiValue = double.parse(bmiResult);
    double indicatorPosition;

    // Calculate position on the scale (BMI range 10-40)
    if (bmiValue < 10) {
      indicatorPosition = 0.0;
    } else if (bmiValue > 40) {
      indicatorPosition = 1.0;
    } else {
      indicatorPosition = (bmiValue - 10) / 30; // Scale from 10 to 40
    }

    return Column(
      children: [
        Stack(
          children: [
            // Background colored bar
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF87CEEB), // Light blue (underweight)
                    Color(0xFF87CEEB),
                    Color(0xFF90EE90), // Light green (normal start)
                    Color(0xFF90EE90), // Light green (normal end)
                    Color(0xFFFFD700), // Yellow (overweight)
                    Color(0xFFFFA07A), // Light orange
                    Color(0xFFFF6B6B), // Red (obese)
                  ],
                  stops: [0.0, 0.28, 0.28, 0.5, 0.5, 0.7, 1.0],
                ),
              ),
            ),
            // Indicator line
            Positioned(
              left: indicatorPosition * 280, // Adjust based on container width
              top: 0,
              bottom: 0,
              child: Container(
                width: 4,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: kActiveCardColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: resultColor,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: kNumberTextStyle.copyWith(fontSize: 100.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        const Text(
                          'Normal BMI range: 18.5 - 24.9',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        _buildBMIRangeIndicator(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: kBottomContainerColor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: const Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
