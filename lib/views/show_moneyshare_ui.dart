import 'package:flutter/material.dart';
import 'package:flutter_app_sau_moneyshared_sau/views/moneyshare_ui.dart';

class ShowMoneyshareUI extends StatefulWidget {
  //สร้างตัวแปรรับค่าที่จะส่งมาจากอีกหน้าจอหนึ่ง
  double? money;
  int? person;
  double? tip;
  double? moneyshare;

  //ที่คอนสตรัส เอาตัวแปรที่สร้างมารับค่าที่จะส่งตัวแปรมาจากอีกค่าหนึ่ง
  ShowMoneyshareUI({
    Key? key,
    this.money,
    this.person,
    this.tip,
    this.moneyshare,
  }) : super(key: key);

  @override
  _ShowMoneyshareUIState createState() => _ShowMoneyshareUIState();
}

class _ShowMoneyshareUIState extends State<ShowMoneyshareUI> {
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
                height: 50.0,
              ),
              Image.asset(
                'assets/images/dollar-icon.png',
                height: 100.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนเงินที่จะหาร',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                widget.money.toString(),
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'บาท'
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนคนที่จะหาร',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                widget.person.toString(),
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'คน'
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'จำนวนเงินที่ทิป',
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                widget.tip.toString(),
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'บาท'
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'สรุปหารกันคนละ',
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 80.0,
                height: 80.0,
                color: Colors.white,
                alignment: Alignment.center,
                child: Text(
                  widget.moneyshare.toString(),
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'บาท'
              ),
            ],
          ),
        ),
      ),
    );
  }
}