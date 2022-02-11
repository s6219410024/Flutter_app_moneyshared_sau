import 'package:flutter/material.dart';
import 'package:flutter_app_sau_moneyshared_sau/views/show_moneyshare_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyshareUI extends StatefulWidget {
  const MoneyshareUI({Key? key}) : super(key: key);

  @override
  _MoneyshareUIState createState() => _MoneyshareUIState();
}

class _MoneyshareUIState extends State<MoneyshareUI> {
  bool? check_tip = false;

  TextEditingController money_ctrl = TextEditingController();
  TextEditingController person_ctrl = TextEditingController();
  TextEditingController tip_ctrl = TextEditingController();

//เมธอด -> โค้ดแสดง Dialog เตือน โดยจะรับข้อความมาแสดงที่ Dialog
  showWarningDialog(context, msg) {
//เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB8E1FF),
      appBar: AppBar(
        backgroundColor: Color(0xFF0B6EB7),
        title: Text('แชร์เงินกันเถอะ'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Image.asset(
                'assets/images/dollar-icon.png',
                height: 170.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 30.0,
                ),
                child: TextField(
                  controller: money_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ป้อนจำนวนเงินบาท (บาท)',
                    hintStyle: TextStyle(
                      color: Color(0xFFAAAAAA),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBillWaveAlt,
                      color: Color(0xFF004C8E),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF1C354B)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF1C354B)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 20.0,
                ),
                child: TextField(
                  controller: person_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ป้อนจำนวนคน (คน)',
                    hintStyle: TextStyle(
                      color: Color(0xFFAAAAAA),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.userNinja,
                      color: Color(0xFF004C8E),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF1C354B)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF1C354B)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (checked) {
                      setState(() {
                        check_tip = checked;
                        if (check_tip == false){
                          tip_ctrl.text='';
                        }
                      });
                    },
                    value: check_tip,
                    activeColor: Color(0xFF000000),
                    side: BorderSide(color: Color(0xFF000000)),
                  ),
                  Text('ทิปให้พนักงานเสริฟ'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 30.0,
                ),
                child: TextField(
                  controller: tip_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'ป้อนจำนวนเงินบาท (บาท)',
                    hintStyle: TextStyle(
                      color: Color(0xFFAAAAAA),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.bitcoin,
                      color: Color(0xFF004C8E),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF1C354B)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF1C354B)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                onPressed: () {
                  //สร้างตัวแปร
                  double? moneyshare = 0;

                  // ตรวจสอบ และ คำนวณ
                  if (money_ctrl.text.isEmpty){
                    showWarningDialog(context, 'ป้อนเงินด้วยจ้าาา');
                    return;
                  } else if (person_ctrl.text.length == 0){
                    showWarningDialog(context, 'ป้อนคนด้วยจ้าาา');
                    return;
                  } else if (check_tip == false){
                    //คำนวณแบบไม่มี tip
                    double? money = double.parse(money_ctrl.text);
                    int? person = int.parse(person_ctrl.text);
                    moneyshare = money / person;
                  } else {
                    //ตรวจสอบว่าได้ป้อน tip หรือยัง
                    if(tip_ctrl.text.isEmpty){
                      showWarningDialog(context, '้ป้อนทิปด้วยยยย');
                      return;
                    }else{
                      //คำนวณแบบมี tip
                      double? money = double.parse(money_ctrl.text);
                      int? person = int.parse(person_ctrl.text);
                      double? tip = double.parse(tip_ctrl.text);
                      moneyshare = (money+tip) / person;
                    }
                  }
                  //ส่งข้อมูลที่ป้อนและที่คำนวณได้ไปแสดงอีกหน้า ShowMoneyshareUI
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowMoneyshareUI(
                        money: double.parse(money_ctrl.text),
                        person: int.parse(person_ctrl.text),
                        tip: double.parse(tip_ctrl.text.isEmpty?'0':tip_ctrl.text),
                        moneyshare: moneyshare,
                      ),
                    ),
                  );
                },
                child: Text(
                  'คำนวณ',
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 80.0,
                      50.0,
                    ),
                    primary: Color(0xFF0004FF)),
              ),
              SizedBox(
                height: 10.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  //กำหนดค่าของ Textfield ทั้ง 3 ตัวให้ว่าง และ checkBox ไม่ติ๊ก
                  setState(() {
                    money_ctrl.text = '';
                    person_ctrl.text = '';
                    tip_ctrl.text = '';

                    check_tip = false;
                  });
                },
                label: Text('ยกเลิก'),
                icon: Icon(
                  FontAwesomeIcons.sync,
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 80.0,
                      50.0,
                    ),
                    primary: Color(0xFFFF0000)),
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
