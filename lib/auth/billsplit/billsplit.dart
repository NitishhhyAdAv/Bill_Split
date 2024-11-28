import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillPage extends StatefulWidget {
  final String bill;
  final String tax;
  final double Tip;
  final double friend_value;

  BillPage(this.bill, this.tax, this.Tip, this.friend_value);
  //const BillPage({super.key, this.bill, this.tax, this.Tip, this.friend_value});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  String final_bill = '';
  @override
  void initState() {
    super.initState();
    amountdivide();
  }

  amountdivide() {
    double taxpayment =
        double.parse(widget.bill) * (double.parse(widget.tax) / 100);
    double bill_final = (double.parse(widget.bill) + widget.Tip + taxpayment) /
        widget.friend_value;
    setState(() {
      final_bill = bill_final.toStringAsFixed(2);
    });
  }

  TextStyle newstyle =
      GoogleFonts.montserrat(fontSize: 17, fontWeight: FontWeight.w800);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 40),
              child: Text(
                "Result",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: const Color.fromARGB(255, 65, 108, 130),
                ),
              ),
            ),
           const  SizedBox(
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
                          "Splited Bill",
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$$final_bill",
                          style: GoogleFonts.montserrat(
                              fontSize: 25, fontWeight: FontWeight.bold),
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
                            Text(widget.friend_value.round().toString(),
                                style: newstyle),
                            Text("\$${widget.Tip.round().toString()}",
                                style: newstyle),
                            Text("${widget.tax} %", style: newstyle),
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
           Column(
             children: [
               Text("your part is $final_bill",
               style: newstyle,),
             SizedBox(
               width: MediaQuery.of(context).size.width/2,
               child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 15, 49, 237),
                ),
                onPressed: ()=>Navigator.pop(context),
                child: Center(child: Text("Split Again",
                style:GoogleFonts.montserrat(
                 fontSize: 17,
                 fontWeight: FontWeight.w800,
                 color: Colors.blueAccent[400],
                 backgroundColor: const Color.fromARGB(255, 47, 23, 207)) ,),
                ),
                ),
             ),
             ],
           ),
          ],
        ),
      ),
    );
  }
}
