import 'package:flutter/material.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';
import 'result_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 170;
  int weight = 70;
  int age = 25;

  late TextEditingController heightController;
  late TextEditingController weightController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    heightController = TextEditingController(text: height.toString());
    weightController = TextEditingController(text: weight.toString());
    ageController = TextEditingController(text: age.toString());
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    ageController.dispose();
    super.dispose();
  }

  void onCalculate() {
    if (selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a gender first')),
      );
      return;
    }

    CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
    String bmiResult = calc.calculateBMI();
    String resultText = calc.getResult();
    Color resultColor = calc.getResultColor();
    String interpretation = calc.getInterpretation();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          bmiResult: bmiResult,
          resultText: resultText,
          resultColor: resultColor,
          interpretation: interpretation,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR'), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.male, size: 80.0, color: Colors.white),
                          SizedBox(height: 15.0),
                          Text('MALE', style: kLabelTextStyle),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.female, size: 80.0, color: Colors.white),
                          SizedBox(height: 15.0),
                          Text('FEMALE', style: kLabelTextStyle),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: kActiveCardColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: heightController,
                          textAlign: TextAlign.center,
                          style: kNumberTextStyle,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '170',
                            hintStyle: TextStyle(
                              color: Color(0xFF8D8E98),
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          onChanged: (value) {
                            int? newHeight = int.tryParse(value);
                            if (newHeight != null &&
                                newHeight >= 120 &&
                                newHeight <= 220) {
                              setState(() {
                                height = newHeight;
                              });
                            }
                          },
                        ),
                      ),
                      const Text('cm', style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: const Color(0xFFEB1555),
                      inactiveColor: const Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                          heightController.text = height.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: kActiveCardColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: kLabelTextStyle),
                        SizedBox(
                          width: 120,
                          child: TextField(
                            controller: weightController,
                            textAlign: TextAlign.center,
                            style: kNumberTextStyle,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '70',
                              hintStyle: TextStyle(
                                color: Color(0xFF8D8E98),
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            onChanged: (value) {
                              int? newWeight = int.tryParse(value);
                              if (newWeight != null && newWeight > 0) {
                                setState(() {
                                  weight = newWeight;
                                });
                              }
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (weight > 1) {
                                    weight--;
                                    weightController.text = weight.toString();
                                  }
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                  weightController.text = weight.toString();
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: kActiveCardColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE', style: kLabelTextStyle),
                        SizedBox(
                          width: 120,
                          child: TextField(
                            controller: ageController,
                            textAlign: TextAlign.center,
                            style: kNumberTextStyle,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '25',
                              hintStyle: TextStyle(
                                color: Color(0xFF8D8E98),
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            onChanged: (value) {
                              int? newAge = int.tryParse(value);
                              if (newAge != null && newAge > 0) {
                                setState(() {
                                  age = newAge;
                                });
                              }
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) {
                                    age--;
                                    ageController.text = age.toString();
                                  }
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                  ageController.text = age.toString();
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onCalculate,
            child: Container(
              color: kBottomContainerColor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: const Center(
                child: Text(
                  'CALCULATE',
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
      resizeToAvoidBottomInset: false,
    );
  }
}
