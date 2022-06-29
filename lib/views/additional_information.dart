import 'package:flutter/material.dart';

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18);
TextStyle infoFont = const TextStyle(
    fontWeight: FontWeight.w400, fontSize: 17, color: Colors.grey);

Widget additionalInformation(
  String humidity,
  String wind,
  String pressure,
  String feelsLike,
  String tempMax,
  String tempMin,
  String visibility,
  String timezone,
) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Rüzgar", style: titleFont),
                const SizedBox(
                  height: 30,
                ),
                Text("Basınç", style: titleFont),
                const SizedBox(
                  height: 30,
                ),
                Text("Max Sıcaklık ", style: titleFont),
                const SizedBox(
                  height: 30,
                ),
                Text("Görüş Alanı", style: titleFont),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(wind, style: infoFont),
                const SizedBox(
                  height: 30,
                ),
                Text(pressure, style: infoFont),
                const SizedBox(
                  height: 30,
                ),
                Text(tempMax, style: infoFont),
                const SizedBox(
                  height: 30,
                ),
                Text(visibility, style: infoFont),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nem", style: titleFont),
                const SizedBox(
                  height: 30,
                ),
                Text("Hissedilen", style: titleFont),
                const SizedBox(
                  height: 30,
                ),
                Text("Min Sıcaklık", style: titleFont),
                const SizedBox(
                  height: 30,
                ),
                Text("Saat Dilimi", style: titleFont),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("%$humidity", style: infoFont),
                const SizedBox(
                  height: 30,
                ),
                Text(feelsLike, style: infoFont),
                const SizedBox(
                  height: 30,
                ),
                Text(tempMin, style: infoFont),
                const SizedBox(
                  height: 30,
                ),
                Text(timezone, style: infoFont),
              ],
            )
          ],
        )
      ],
    ),
  );
}
