import 'package:flutter/material.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {

  double _C = 0,
      _F = 32,
      _K = 273.15;

  //ฟังชั่นคำนวณ
  void _calculateTemperature(){
    setState(() {
      //แปลงข้อความ เป็นตัวเลข ถ้าไม่ได้เป็น 0
      _C = double.tryParse(_cController.text) ?? 0;

      _F = (_C * 9 / 5) + 32;
      _K = _C + 273.15;
    });
  }

  //ควบคุม textField
  final TextEditingController _cController = TextEditingController();

  //ปรับแต่ง textfield
  final InputDecoration textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.orange.shade100,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.orange.shade200,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.orange,
        width: 2,
      ),
    ),
    labelStyle: TextStyle(
      color: Colors.orange.shade700,
      fontWeight: FontWeight.bold,
    ),
  );

  //ปรับแต่ง titleText
  final TextStyle titleTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold
  );

  //ปรับแต่ง valueText
  final TextStyle valueTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (celsius) => _calculateTemperature(),
                controller: _cController,
                decoration: textFieldStyle.copyWith(
                  labelText: "Celsius \u00B0C",
                  hintText: "กรุณาใส่องศา",
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        _cardResult("Fahrenheit","${_F.toStringAsFixed(2)} \u00B0F", Colors.blue),
        SizedBox(
          height: 20,
        ),
        _cardResult("Kelvin", "${_K.toStringAsFixed(2)} K", Colors.red),
      ],
    );
  }

  //ฟังชั่นสร้าง card
  Widget _cardResult(String title, String value, Color color){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2,
          color: color,
        ),
        color: color.withOpacity(0.3),
      ),
      child: Column(
        children: [
          Text(
            "$title",
            style: titleTextStyle.copyWith(
              color: color,
            ),
          ),
          Text(
            "$value",
            style: valueTextStyle.copyWith(
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  //เคลียร์ทรัพยากร
  @override
  void dispose() {
    //เคลียร์ตัวแปร
    _cController.dispose();
    //เคลียร์ส่วนที่เหลือ
    super.dispose();
  }
}