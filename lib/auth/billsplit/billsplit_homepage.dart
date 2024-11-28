import 'package:billsplit_apk/auth/billsplit/billsplit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Splitwise extends StatefulWidget {
  const Splitwise({super.key});

  @override
  State<Splitwise> createState() => _SplitwiseState();
}

class _SplitwiseState extends State<Splitwise> {
  double Tip = 0.0;
  String tax = '0';
  String bill = '';
  double friend_value = 0.0;
  dynamic Custom_Buttons(String text) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(20),
        ),
        onPressed: () {
          if (text == '-') {
            setState(() {
              bill = '';
            });
          } else {
            setState(() {
              bill = bill + text;
            });
          }
        },
        child: Text(
          text,
          style:
              GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  TextStyle newstyle =
      GoogleFonts.montserrat(fontSize: 17, fontWeight: FontWeight.w800);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 40),
                child: Text(
                  "Split Bills",
                  style: GoogleFonts.montserrat(
                      color: const Color.fromARGB(255, 39, 207, 244),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(color: Colors.pink[300]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: GoogleFonts.montserrat(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            bill,
                            style: GoogleFonts.montserrat(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Friends", style: newstyle),
                              Text("Tip", style: newstyle),
                              Text("Tax", style: newstyle),
                            ],
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(friend_value.round().toString(),
                                  style: newstyle),
                              Text("\$${Tip.round().toString()}",
                                  style: newstyle),
                              Text("$tax %", style: newstyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "How Many Are U Guys?",
                style: newstyle,
              ),
              Slider(
                  min: 0,
                  max: 20,
                  activeColor: Colors.cyan[400],
                  inactiveColor: const Color.fromARGB(255, 244, 39, 220),
                  value: friend_value,
                  onChanged: (value) {
                    setState(() {
                      friend_value = value;
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 60,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 12, 89),
                        borderRadius: BorderRadius.circular(16.6)),
                    child: Column(
                      children: [
                        Text(
                          "TIP",
                          style: newstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 30,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    Tip--;
                                  });
                                },
                                backgroundColor: Colors.cyan[150],
                                child: const Icon(Icons.remove,
                                    color: Colors.black),
                              ),
                            ),
                            Text(
                              "\$${Tip.round().toString()}",
                              style: newstyle,
                            ),
                            SizedBox(
                              width: 40,
                              height: 30,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    Tip++;
                                  });
                                },
                                backgroundColor: Colors.cyan[150],
                                child:
                                    const Icon(Icons.add, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 60,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 12, 89),
                        borderRadius: BorderRadius.circular(16.6)),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            tax = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          labelText: "Tax %",
                          labelStyle: GoogleFonts.montserrat(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Custom_Buttons("1"),
                  Custom_Buttons("2"),
                  Custom_Buttons("3"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Custom_Buttons("4"),
                  Custom_Buttons("5"),
                  Custom_Buttons("6"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Custom_Buttons("7"),
                  Custom_Buttons("8"),
                  Custom_Buttons("9"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Custom_Buttons("."),
                  Custom_Buttons("0"),
                  Custom_Buttons("-"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 73, 213, 234)),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BillPage(bill, tax, Tip, friend_value))),
                child: Center(
                  child: Text(
                    "Split Bill",
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 66, 41, 152)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
