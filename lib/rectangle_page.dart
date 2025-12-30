import 'package:flutter/material.dart';

class RectanglePage extends StatefulWidget {
  const RectanglePage({super.key});

  @override
  State<RectanglePage> createState() => _RectanglePageState();
}

class _RectanglePageState extends State<RectanglePage> {

  int _width = 0,
      _length = 0,
      _area = 0;

  //ควบคุม textField
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _lengthController = TextEditingController();

  //ปรับแต่ง textfield
  final InputDecoration textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Color(0xff53d2dc).withOpacity(0.2),
    //เมื่อไม่ได้กดใช้
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: Color(0xff53d2dc),
        width: 1,
      ),
    ),
    //เมื่อกดใช้งาน
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(
        color: Color(0xff4f8fc0),
        width: 2,
      ),
    ),
    labelStyle: TextStyle(
      color: Color(0xff26648e),
    ),
  );

  //ปรับแต่ง text rectangle
  final TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20
  );

  //ฟังชั่นคำนวณ
  void _calculateArea(){
    //แปลงข้อความ เป็นตัวเลข ถ้าไม่ได้เป็น 0
    _width = int.tryParse(_widthController.text) ?? 0;
    _length = int.tryParse(_lengthController.text) ?? 0;

    setState(() {
      _area = _width * _length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child:TextField(
                controller: _widthController,
                keyboardType: TextInputType.number,
                decoration: textFieldStyle.copyWith(
                  labelText: "กว้าง",
                  hintText: "กรุณาใส่ความกว้าง",
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              flex: 1,
              child:TextField(
                controller: _lengthController,
                keyboardType: TextInputType.number,
                decoration: textFieldStyle.copyWith(
                  labelText: "ยาว",
                  hintText: "กรุณาใส่ความยาว",
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Expanded(
              child:ElevatedButton(
                onPressed: () => _calculateArea(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff26648e),
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  "คำนวณ",
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "สี่เหลี่ยมพื้นผ้า กว้าง $_widthม. ยาว $_lengthม. มีขนาดพื้นที่ $_area ตร.ม.",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        if(_area>0)
          //รูปสี่เหลี่ยม
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "$_widthม.",
                      style: textStyle.copyWith(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$_lengthม.",
                      style: textStyle.copyWith(),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: _width.toDouble()*20,
                      height: _length.toDouble()*20,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.3),
                        border: Border.all(
                          width: 2,
                          color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "$_areaตร.ม.",
                        style: textStyle.copyWith(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        //endif
      ],
    );
  }

  //เคลียร์ทรัพยากร
  @override
  void dispose(){
    //เคลียร์ตัวแปร
    _lengthController.dispose();
    _widthController.dispose();
    //เคลียร์ส่วนที่เหลือ
    super.dispose();
  }
}