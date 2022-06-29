import 'package:deneme/model/weather_model.dart';
import 'dart:convert';
import 'package:deneme/servis/weather_api.dart';
import 'package:deneme/views/additional_information.dart';
import 'package:deneme/views/current_weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Iskele()));
}

class Iskele extends StatefulWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  State<Iskele> createState() => _IskeleState();
}

class _IskeleState extends State<Iskele> {
  WeatherApi client = WeatherApi();
  Weather? data = Weather();
  Future<void> getData() async {
    data = await client.getCurrentWeather(_secilenSehir);
  }

  String? _secilenSehir = "Gaziantep";
  final List<String> _tumsehirler = [
    "ADANA",
    "Adıyaman",
    "AFYONKARAHİSAR",
    "AĞRI",
    "AMASYA",
    "Ankara",
    "ANTALYA",
    "ARTVİN",
    "AYDIN",
    "BALIKESİR",
    "BİLECİK",
    "BİNGÖL",
    "BİTLİS",
    "BOLU",
    "BURDUR",
    "Bursa",
    "ÇANAKKALE",
    "ÇANKIRI",
    "ÇORUM",
    "DENİZLİ",
    "DİYARBAKIR",
    "EDİRNE",
    "ELAZIĞ",
    "ERZİNCAN",
    "ERZURUM",
    "ESKİŞEHİR",
    "Gaziantep",
    "GİRESUN",
    "GÜMÜŞHANE",
    "HAKKARİ",
    "HATAY",
    "ISPARTA",
    "MERSİN",
    "İstanbul",
    "İzmir",
    "KARS",
    "KASTAMONU",
    "KAYSERİ",
    "KIRKLARELİ",
    "KIRŞEHİR",
    "KOCAELİ (İZMİT)",
    "KONYA",
    "KÜTAHYA",
    "MALATYA",
    "MANİSA",
    "KAHRAMANMARAŞ",
    "MARDİN",
    "MUĞLA",
    "MUŞ",
    "NEVŞEHİR",
    "NİĞDE",
    "ORDU",
    "RİZE",
    "SAKARYA (ADAPAZARI)",
    "SAMSUN",
    "SİİRT",
    "SİNOP",
    "SİVAS",
    "TEKİRDAĞ",
    "TOKAT",
    "TRABZON",
    "TUNCELİ",
    "ŞANLIURFA",
    "UŞAK",
    "Van",
    "YOZGAT",
    "ZONGULDAK",
    "AKSARAY",
    "BAYBURT",
    "KARAMAN",
    "KIRIKKALE",
    "BATMAN",
    "ŞIRNAK",
    "BARTIN",
    "ARDAHAN",
    "IĞDIR",
    "YALOVA",
    "KARABÜK",
    "KİLİS",
    "OSMANİYE",
    "DÜZCE"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Hava Durumu",
          style: TextStyle(
              color: Colors.black, fontSize: 35, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentWeather("${data?.temp}", "${data?.cityName}",
                    "${data?.description}"),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Ek Bilgiler",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  height: 2,
                  thickness: 3,
                ),
                const SizedBox(
                  height: 20,
                ),
                additionalInformation(
                    "${data?.humidity}",
                    "${data?.wind}",
                    "${data?.pressure}",
                    "${data?.feels_like}",
                    "${data?.temp_max}",
                    "${data?.temp_min}",
                    "${data?.visibility}",
                    "${data?.timezone}"),
                SizedBox(
                  height: 75,
                ),
                Center(
                  child: DropdownButton<String>(
                    elevation: 5,
                    hint: const Text("Şehir Seçiniz"),
                    style: const TextStyle(color: Colors.black, fontSize: 28),
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 32,
                    underline: Container(
                      height: 3,
                      color: Colors.black,
                    ),
                    items: _tumsehirler
                        .map((oankiSehir) => DropdownMenuItem(
                              value: oankiSehir,
                              child: Text(oankiSehir),
                            ))
                        .toList(),
                    value: _secilenSehir,
                    onChanged: (String? yeni) {
                      setState(() {
                        _secilenSehir = yeni;
                      });
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    ));
  }
}
