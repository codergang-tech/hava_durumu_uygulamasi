import 'package:flutter/material.dart';

Widget currentWeather(String temp, String location, String description) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          temp,
          style: const TextStyle(fontSize: 56),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          location,
          style: const TextStyle(fontSize: 22, color: Colors.grey),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          description,
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ],
    ),
  );
}
