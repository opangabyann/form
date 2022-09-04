// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_final_fields, prefer_final_fields

import "package:flutter/material.dart";
import 'package:intl/intl.dart';

enum Kelas { pagi, malam }

class Textfield extends StatefulWidget {
  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController hp = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _time = TextEditingController();

  String? materi;
  List<String> listMateri = ['html & css', "flutter", "javascript", 'react js'];

  String? jenisKelamin;

  Kelas? _jenisKelas = Kelas.pagi;
  bool paket1 = false;
  bool paket2 = false;
  bool paket3 = false;
  String? dataBonus;

  
  void _kirimData() {
    if (paket1 == true) {
      setState(() {
        dataBonus = "github";
      });
    }
    if (paket2 == true) {
      setState(() {
        dataBonus = "$dataBonus UI & UX";
      });
    }
    if (paket3 == true) {
      setState(() {
        dataBonus = "$dataBonus UAT";
      });
    }

    AlertDialog alertDialog = AlertDialog(
      content: Container(
        height: 200,
        child: Column(
          children: [
            Text("nama lengkap : ${nama.text}"),
            Text("email : ${email.text}"),
            Text("nomor hp : ${hp.text}"),
            Text("password : ${password.text}"),
            Text("materi : ${materi}"),
            Text("jenis kelamin : ${jenisKelamin}"),
            Text("bonus : ${dataBonus}"),
          ],
        ),
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("text field"),
      ),
      body: SizedBox(
        child: Container(
          margin: EdgeInsets.only(left: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                TextField(
                  controller: nama,
                  decoration: InputDecoration(
                      hintText: "your name",
                      labelText: "kimi no namae",
                      icon: Icon(Icons.people)),
                ),
                TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "your email",
                      labelText: "email",
                      icon: Icon(Icons.email_outlined)),
                ),
                TextField(
                  controller: hp,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "hp", labelText: "hp", icon: Icon(Icons.phone)),
                ),
                TextField(
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "password",
                      labelText: "password",
                      helperText: "wajib 8 karakter",
                      icon: Icon(Icons.people)),
                ),
                DropdownButton(
                  items: listMateri.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      materi = value;
                    });
                  },
                  value: materi,
                  hint: Text('materi yang diambil'),
                  isExpanded: true,
                ),
                Row(
                  children: [
                    Radio(
                      value: "priya",
                      groupValue: jenisKelamin,
                      onChanged: (String? value) {
                        setState(() {
                          jenisKelamin = "priya";
                        });
                      },
                      activeColor: Colors.orange[900],
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            jenisKelamin = "priya";
                          });
                        },
                        child: Text("priya")),
                    Radio(
                      value: "wanita",
                      groupValue: jenisKelamin,
                      onChanged: (String? value) {
                        setState(() {
                          jenisKelamin = "wanita";
                        });
                      },
                      activeColor: Colors.blue[900],
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            jenisKelamin = "wanita";
                          });
                        },
                        child: Text("wanita")),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 20), child: Text("pilih kelas")),
                RadioListTile<Kelas>(
                  title: Text("pagi"),
                  value: Kelas.pagi,
                  groupValue: _jenisKelas,
                  onChanged: (value) {
                    setState(() {
                      _jenisKelas = value;
                    });
                  },
                ),
                RadioListTile<Kelas>(
                  title: Text("malam"),
                  value: Kelas.malam,
                  groupValue: _jenisKelas,
                  onChanged: (value) {
                    setState(() {
                      _jenisKelas = value;
                    });
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: paket1,
                      onChanged: (bool? value) {
                        setState(() {
                          paket1:
                          value!;
                        });
                      },
                    ),
                    Text("github"),
                    Checkbox(
                      value: paket2,
                      onChanged: (bool? value) {
                        setState(() {
                          paket2:
                          value!;
                        });
                      },
                    ),
                    Text("UI & UX"),
                    Checkbox(
                      value: paket3,
                      onChanged: (bool? value) {
                        setState(() {
                          paket3:
                          value!;
                        });
                      },
                    ),
                    Text("UAT"),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: _date,
                    decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today_rounded),
                      labelText : "pilih tanggal",
                    ),
                    onTap: () async{
                      DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate : DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025),
                      );
                        if (pickeddate != null){
                          setState(() {
                            _date.text = DateFormat("yyyy-MM-dd",).format(pickeddate);
                          });
                        }
                      
                    },
                  ),
                ),
                Padding(
                padding: const EdgeInsets.all(0.0),
                child: TextField(
                    controller: _time,
                    decoration: InputDecoration(
                      icon: Icon(Icons.access_time),
                      labelText: 'Select Time',
                    ),
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (pickedTime != null) {
                        print(pickedTime.format(context)); //output 10:51 PM
                        DateTime parsedTime = DateFormat.jm()
                            .parse(pickedTime.format(context).toString());
                        //converting to DateTime so that we can further format on different pattern.
                        print(parsedTime); //output 1970-01-01 22:53:00.000
                        String formattedTime =
                            DateFormat('HH:mm:ss').format(parsedTime);
                        print(formattedTime); //output 14:59:00
                        //DateFormat() is from intl package, you can format the time on any pattern you need.

                        setState(() {
                          _time.text =
                              formattedTime; //set the value of text field.
                        });
                      }
                    }),
              ),
                ElevatedButton(
                    onPressed: () {
                      _kirimData();
                    },
                    child: Text("submit maseh"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
