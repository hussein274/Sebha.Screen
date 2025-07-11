import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  List<Map<String, int>> sebhaList = [
    {'سبحان الله': 33},
    {'الحمدلله': 33},
    {'الله أكبر': 34},
    {'لا إله\n إلا الله': 1},
    {'سبحان الله\n وبحمده': 100},
    {'سبحان الله \nالعظيم': 100},
    {'لا حول ولا قوة \nإلا بالله': 100},
    {'أستغفر الله': 100},
    {'لا إله إلا أنت سبحانك \nإني كنت من الظالمين': 100},
    {'اللهم صل وسلم على نبينا محمد': 100},
  ];
  int currentSebha = 0;
  int counter = 0;
  late String currentText;

  @override
  void initState() {
    super.initState();
    currentText = sebhaList[currentSebha].keys.first;
  }

  void buildSebha() {
    int currentKey = sebhaList[currentSebha].values.first;
    if (counter >= currentKey) {
      if (currentSebha < sebhaList.length - 1) {
        currentSebha++;
      } else {
        currentSebha = 0;
      }
      currentText = sebhaList[currentSebha].keys.first;
      counter = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/sebha_bg.png",
            fit: BoxFit.fill,
            height: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xB3000000), Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset("assets/images/islamiLogo.png"),
                ),
                SizedBox(height: 10),
                Text(
                  "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                InkWell(
                  onTap: () {
                    setState(() {
                      counter++;
                      buildSebha();
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * .5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/sebha.png"),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 70),
                        Text(
                          currentText,
                          style: TextStyle(color: Colors.white, fontSize: 36),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "${counter}",
                          style: TextStyle(color: Colors.white, fontSize: 36),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
