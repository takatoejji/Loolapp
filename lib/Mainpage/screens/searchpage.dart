import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:interfaces/Mainpage/model/qrcodem.dart';
import 'package:interfaces/constante.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Search_page extends StatefulWidget {
  @override
  _State_search_page createState() {
    return _State_search_page();
  }
}

class _State_search_page extends State<Search_page> {
  final _searchkey = GlobalKey<FormState>();
  String dropdownvalue;
  var brands = ["acer", "asus", "dell", "hp", "lenovo", "microsoft", "msi", "toshiba"];
  var cpu_b = ["amd", "intel"];
  var cpu_modifier = ["ryzen 3", "i3", "i5", "i7", "ryzen 3", "ryzen 5", "ryzen 7", "celeron"];
  var cpu_model = [
    8250,
    1035,
    10210,
    7300,
    10500,
    1165,
    7200,
    11800,
    1115,
    4020,
    6300,
    4800,
    10750,
    8350,
    9750,
    4600,
    1065,
    10300,
    8300,
    11370,
    8750,
    3750,
    6700,
    4700,
    3060,
    6600,
    10510,
    10310,
    5200,
    8565,
    6500,
    8365,
    10610,
    10870,
    1135,
    11400,
    3500,
    1145,
    1185,
    1005,
    7500,
    8650,
    9300,
    3610,
    8265,
    5300,
    6006,
    7700,
    4210,
    6820,
    6200,
    5900,
    4000,
    8130,
    5005,
    2670,
    7410
  ];
  var cpu_pl = ["g1", "g4", "g7", "h", "hq", "mq", "n", "u"];
  var gpu_brand = ["Integrated", "Amd", "Nvidia"];
  var gpu_series = ["intergrated", "gtx", "rtx", "mx", "radeon", "quadro", "gt"];
  var gpu_model = [
    "integrated",
    "1650",
    "1660 ti",
    "3060",
    "2070",
    "3070",
    "3050 ti",
    "1050 ti",
    "330",
    "1650 ti",
    "m260",
    "560m",
    "m530",
    "350",
    "1070",
    "1050",
    "2080 super",
    "230",
    "m430",
    "150",
    "740m",
    "130",
    "1060",
    "950m",
    "110",
    "k1000m",
    "3080",
    "850m",
    "m3000 m"
  ];
  var ram_type = ["ddr3", "ddr3l", "lpddr3", "lpddr3x", "ddr4", "ddr4x"];
  var screen_res = ["HD", "FHD", "QHD", "QHD+", "UHD"];
  var screen_type = ["IPS", "LCD", "LED", "TN"];
  var tactile = ["YES", "NO"];
  var fingerprint = ["YES", "NO"];
  var condition = ["NEW", "USED"];
  String brand, cpu_brand, cpu_family, gpu_b, gpu_s, gpu_m, ram_t, screen_re, screen_p, tch, fprint, cond, pl;
  int cpu_m, gpu_vr, ram_s, ram_f, ref, hdds, ssds, m2s;
  double screen_s;
  Future<String> predictPrice(var body) async {
    var client = new http.Client();
    var uri = Uri.parse("https://loolapp.herokuapp.com/predict");
    Map<String, String> headers = {"Content-type": "application/json"};
    String jsonString = json.encode(body);
    print(jsonString);
    try {
      var resp = await client.post(uri, headers: headers, body: jsonString);
      //var resp = await http.get(Uri.parse("https://loolapp.herokuapp.com"));
      if (resp.statusCode == 200) {
        print("DATA FETCHED SUCCESSFULLY");
        print(resp.body);
        var result = resp.body;
        print(result);
        return result;
      }
    } catch (e) {
      print("EXCEPTION OCCURRED: $e");
      return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _searchkey,
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/2.png"), fit: BoxFit.cover)),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                      child: Text(
                    "BRAND",
                    style: TextStyle(fontSize: 25, fontFamily: "Tajawal", color: Colors.white),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: dropdown,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                    ),
                    child: DropdownButtonFormField(
                      icon: Icon(Icons.keyboard_arrow_down),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                      ),
                      items: brands.map(
                        (String brands) {
                          return DropdownMenuItem(
                            value: brands,
                            child: Text(brands),
                          );
                        },
                      ).toList(),
                      onChanged: (newValue) {
                        brand = newValue;
                        setState(() {
                          dropdownvalue = newValue.toString();
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "CPU",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: "Tajawal", color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Container(
                    child: Text("Cpu brand", style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: dropdown,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                    ),
                    child: DropdownButtonFormField(
                      icon: Icon(Icons.keyboard_arrow_down),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                      ),
                      items: cpu_b.map(
                        (String cpu_b) {
                          return DropdownMenuItem(
                            value: cpu_b,
                            child: Text(cpu_b),
                          );
                        },
                      ).toList(),
                      onChanged: (newValue) {
                        cpu_brand = newValue;
                        setState(() {
                          dropdownvalue = newValue.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(children: [
                  Container(
                    child: Text("Cpu Modifier", style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: dropdown,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                    ),
                    child: SizedBox(
                      width: 110,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                        ),
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: cpu_modifier.map(
                          (String cpu_modifier) {
                            return DropdownMenuItem(
                              value: cpu_modifier,
                              child: Text(cpu_modifier),
                            );
                          },
                        ).toList(),
                        onChanged: (newValue) {
                          cpu_family = newValue;
                          setState(() {
                            dropdownvalue = newValue.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ]),
                Column(children: [
                  Container(
                    child: Text("Cpu model", style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: dropdown,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                    ),
                    child: SizedBox(
                        width: 220,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                          ),
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: cpu_model.map(
                            (int cpu_model) {
                              return DropdownMenuItem(
                                value: cpu_model,
                                child: Text(cpu_model.toString()),
                              );
                            },
                          ).toList(),
                          onChanged: (newValue) {
                            cpu_m = newValue;
                            setState(() {
                              dropdownvalue = newValue.toString();
                            });
                          },
                        )),
                  )
                ]),
              ]),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    child: Text(
                      "Cpu Productline",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: dropdown,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                    ),
                    child: SizedBox(
                      width: 150,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                        ),
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: cpu_pl.map(
                          (String cpu_pl) {
                            return DropdownMenuItem(
                              value: cpu_pl,
                              child: Text(cpu_pl),
                            );
                          },
                        ).toList(),
                        onChanged: (newValue) {
                          pl = newValue;
                          setState(() {
                            dropdownvalue = newValue.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "GPU",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: "Tajawal", color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Column(children: [
                Container(
                  child: Text("Gpu brand", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: dropdown,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                  ),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                    ),
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: gpu_brand.map(
                      (String gpu_brand) {
                        return DropdownMenuItem(
                          value: gpu_brand,
                          child: Text(gpu_brand),
                        );
                      },
                    ).toList(),
                    onChanged: (newValue) {
                      gpu_b = newValue;
                      setState(() {
                        dropdownvalue = newValue.toString();
                      });
                    },
                  ),
                )
              ]),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 130,
                  child: Column(children: [
                    Container(
                      child: Text("Gpu series", style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: dropdown,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                      ),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                        ),
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: gpu_series.map(
                          (String gpu_series) {
                            return DropdownMenuItem(
                              value: gpu_series,
                              child: Text(gpu_series),
                            );
                          },
                        ).toList(),
                        onChanged: (newValue) {
                          gpu_s = newValue;
                          setState(() {
                            dropdownvalue = newValue.toString();
                          });
                        },
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  width: 250,
                  child: Column(children: [
                    Container(
                      child: Text("Gpu model", style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: dropdown,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                      ),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                        ),
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: gpu_model.map(
                          (String gpu_model) {
                            return DropdownMenuItem(
                              value: gpu_model,
                              child: Text(gpu_model),
                            );
                          },
                        ).toList(),
                        onChanged: (newValue) {
                          gpu_m = newValue;
                          setState(() {
                            dropdownvalue = newValue.toString();
                          });
                        },
                      ),
                    )
                  ]),
                ),
              ]),
              SizedBox(
                height: 15,
              ),
              Column(children: [
                Container(
                  child: Text("Gpu Vram", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 250,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: dropdown,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                      onChanged: (val) {
                        gpu_vr = int.parse(val);
                      },
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: 15,
              ),
              Text(
                "RAM",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: "Tajawal", color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 130,
                  child: Column(children: [
                    Container(
                      child: Text("Ram size", style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: dropdown,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        onChanged: (val) {
                          ram_s = int.parse(val);
                        },
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  width: 250,
                  child: Column(children: [
                    Container(
                      child: Text("Ram type", style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: dropdown,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                      ),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                        ),
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: ram_type.map(
                          (String ram_type) {
                            return DropdownMenuItem(
                              value: ram_type,
                              child: Text(ram_type),
                            );
                          },
                        ).toList(),
                        onChanged: (newValue) {
                          ram_t = newValue;
                          setState(() {
                            dropdownvalue = newValue.toString();
                          });
                        },
                      ),
                    )
                  ]),
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Column(children: [
                Container(
                  child: Text("Ram frequency", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: dropdown,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                  ),
                  child: SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                      onChanged: (val) {
                        ram_f = int.parse(val);
                      },
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: 15,
              ),
              Text(
                "SCREEN",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: "Tajawal", color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 130,
                    child: Column(children: [
                      Container(
                        child: Text("Screen size", style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: dropdown,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                          onChanged: (val) {
                            screen_s = double.parse(val);
                          },
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    width: 250,
                    child: Column(children: [
                      Container(
                        child: Text("Screen Resolution", style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: dropdown,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                        ),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                          ),
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: screen_res.map(
                            (String screen_res) {
                              return DropdownMenuItem(
                                value: screen_res,
                                child: Text(screen_res),
                              );
                            },
                          ).toList(),
                          onChanged: (newValue) {
                            screen_re = newValue;
                            setState(() {
                              dropdownvalue = newValue.toString();
                            });
                          },
                        ),
                      )
                    ]),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 130,
                  child: Column(children: [
                    Container(
                      child: Text("Screen Panel", style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: dropdown,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                      ),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                        ),
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: screen_type.map(
                          (String screen_type) {
                            return DropdownMenuItem(
                              value: screen_type,
                              child: Text(screen_type),
                            );
                          },
                        ).toList(),
                        onChanged: (newValue) {
                          screen_p = newValue;
                          setState(() {
                            dropdownvalue = newValue.toString();
                          });
                        },
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  width: 250,
                  child: Column(children: [
                    Container(
                      child: Text("Refreshrate", style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: dropdown,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        onChanged: (val) {
                          ref = int.parse(val);
                        },
                      ),
                    )
                  ]),
                ),
              ]),
              SizedBox(
                height: 15,
              ),
              Column(children: [
                Container(
                  child: Text("Touchscreen", style: TextStyle(color: Colors.white)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: dropdown,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                  ),
                  child: SizedBox(
                    width: 250,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                      ),
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: tactile.map(
                        (String tactile) {
                          return DropdownMenuItem(
                            value: tactile,
                            child: Text(tactile),
                          );
                        },
                      ).toList(),
                      onChanged: (newValue) {
                        tch = newValue;
                        setState(() {
                          dropdownvalue = newValue.toString();
                        });
                      },
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: 15,
              ),
              Text(
                "STORAGE",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: "Tajawal", color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 120,
                  child: Column(children: [
                    Container(
                      child: Text("HDD size", style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: dropdown,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        onChanged: (val) {
                          hdds = int.parse(val);
                        },
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  width: 120,
                  child: Column(children: [
                    Container(
                      child: Text("SSD size", style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: dropdown,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: shadows, style: BorderStyle.solid, width: 0.80),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        onChanged: (val) {
                          ssds = int.parse(val);
                        },
                      ),
                    )
                  ]),
                ),
                SizedBox(
                  width: 120,
                  child: Column(children: [
                    Container(
                      child: Text("M.2 size", style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: dropdown,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        onChanged: (val) {
                          m2s = int.parse(val);
                        },
                      ),
                    )
                  ]),
                ),
              ]),
              SizedBox(
                height: 15,
              ),
              Column(children: [
                Container(
                  child: Text("Fingerprint sensor", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: dropdown,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                  ),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                    ),
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: fingerprint.map(
                      (String fingerprint) {
                        return DropdownMenuItem(
                          value: fingerprint,
                          child: Text(fingerprint),
                        );
                      },
                    ).toList(),
                    onChanged: (newValue) {
                      fprint = newValue;
                      setState(() {
                        dropdownvalue = newValue.toString();
                      });
                    },
                  ),
                )
              ]),
              SizedBox(
                height: 15,
              ),
              Column(children: [
                Container(
                  child: Text("The condition", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: dropdown,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: shadows, style: BorderStyle.solid, width: 3),
                  ),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                    ),
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: condition.map(
                      (String condition) {
                        return DropdownMenuItem(
                          value: condition,
                          child: Text(condition),
                        );
                      },
                    ).toList(),
                    onChanged: (newValue) {
                      cond = newValue;
                      setState(() {
                        dropdownvalue = newValue.toString();
                      });
                    },
                  ),
                )
              ]),
              FlatButton(
                color: bleu,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onPressed: () async {
                  var body = {
                    "brand": [brand],
                    "cpu_brand": [cpu_brand],
                    "cpu_family": [cpu_family],
                    "cpu_model": [cpu_m],
                    "product_line": [pl],
                    "gpu_brand": [gpu_b],
                    "gpu_series": [gpu_s],
                    "gpu_model": [gpu_m],
                    "gpu_vram": [gpu_vr],
                    "ram_size": [ram_s],
                    "ram_type": [ram_t],
                    "ram_freq": [ram_f],
                    "screen_size": [screen_s],
                    "screen_res": [screen_re],
                    "screen_type": [screen_p],
                    "refreshrate": [ref],
                    "tactil": [tch],
                    "hdd": [hdds],
                    "ssd": [ssds],
                    "m.2": [m2s],
                    "fingerprint": [fprint],
                    "condition": [cond]
                  };

                  print(body);
                  var resp = await predictPrice(body);
                  _onBasicAlertPressed(context, resp);
                },
                child: Text("Get price"),
              ),
              ElevatedButton(
                onPressed: () async {
                  var body = {
                    "brand": [brand],
                    "cpu_brand": [cpu_brand],
                    "cpu_family": [cpu_family],
                    "cpu_model": [cpu_m],
                    "gpu_brand": [gpu_b],
                    "gpu_series": [gpu_s],
                    "gpu_model": [gpu_m],
                    "gpu_vram": [gpu_vr],
                    "ram_size": [ram_s],
                    "ram_type": [ram_t],
                    "ram_freq": [ram_f],
                    "screen_size": [screen_s],
                    "screen_res": [screen_re],
                    "screen_type": [screen_p],
                    "refreshrate": [ref],
                    "tactil": [tch],
                    "hdd": [hdds],
                    "ssd": [ssds],
                    "m.2": [m2s],
                    "fingerprint": [fprint],
                    "condition": [cond]
                  };
                  var resp = await predictPrice(body);
                  Qr_coder generator = Qr_coder();
                  var generated_data = generator.qrcodegen(body, resp);

                  Navigator.pushNamed(context, '/genedqrcode', arguments: generated_data);
                },
                child: Text("Predict and qrcode"),
              ),
            ],
          ),
        ));
  }

  _onBasicAlertPressed(context, resp) {
    Alert(context: context, title: "Predicted price", desc: resp).show();
  }
}
