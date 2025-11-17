import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sayfa(title: ''),
    );
  }
}

class Sayfa extends StatefulWidget {
  const Sayfa({super.key, required this.title});
  final String title;

  @override
  State<Sayfa> createState() => _SayfaState();
}

class _SayfaState extends State<Sayfa> {
  String mesaj = "~Hesap Makinesi~";
  List<String> gecmis=[];
  TextEditingController kontrol = TextEditingController();
  String kullaniciYazisi = "";
  TextEditingController sayi1 = TextEditingController();
  TextEditingController sayi2 = TextEditingController();

  String sonuc = "";

  void mesajDegistir() {
    setState(() {
      mesaj = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 70, 1, 1), // AppBar rengi
      ),*/
      body: Stack(
        children: [
          // 1️⃣ Arka plan resmi
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/arkaplan_resim.png"), // buraya kendi resim yolunu yaz
                fit: BoxFit.cover,
              ),
            ),
          ),
          // 2️⃣ Orta kısımdaki Container
          Center(
            child: Container(
              width: 500,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 194, 194, 194),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    mesaj,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 85, 6, 0),
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: sayi1,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 18),
                          decoration: const InputDecoration(
                            labelText: " 1.Sayı ",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: sayi2,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 18),
                          decoration: const InputDecoration(
                            labelText: "2. Sayı",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            double a = double.tryParse(sayi1.text) ?? 0;
                            double b = double.tryParse(sayi2.text) ?? 0;
                            sonuc = " ${a + b}";
                            gecmis.add("$a+ $b = $sonuc");
                          }
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 210, 225),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("+"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            double a = double.tryParse(sayi1.text) ?? 0;
                            double b = double.tryParse(sayi2.text) ?? 0;
                            sonuc = "${a - b}";
                            gecmis.add(" $a - $b = $sonuc");
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 210, 225),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        child: const Text("-"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            double a = double.tryParse(sayi1.text) ?? 0;
                            double b = double.tryParse(sayi2.text) ?? 0;
                            sonuc = "${a * b}";
                            gecmis.add("$a * $b = $sonuc");
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 210, 225),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                        child: const Text("x"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            double a = double.tryParse(sayi1.text) ?? 0;
                            double b = double.tryParse(sayi2.text) ?? 0;
                            if (b == 0) {
                              sonuc = "Hata 0'a bölünmez";
                            } else {
                              sonuc = "${a / b}";
                              gecmis.add("$a / $b = $sonuc");
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 210, 225),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                        child: const Text("/"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(29),
                    child: Card(
                      color: const Color.fromARGB(255, 255, 240, 239),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            sonuc,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 70, 1, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: Card(
                      elevation: 3,
                      child: ListView.builder(
                        itemCount: gecmis.length,
                        itemBuilder: (context,index) {
                          return ListTile(
                            dense: true,
                            title: Text(
                              gecmis[index],
                              style: const TextStyle(fontSize: 16),
                            ),
                          );
                        }
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
Widget _islemButtonu(String sembol, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 255, 210, 225),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

    ),
    child: Text(sembol),
    );
}
