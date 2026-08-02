import 'package:flutter/material.dart';
class WeatherUtils {
// Convierte Celsius a Fahrenheit
static double celsiusToFahrenheit(int celsius) {
return (celsius * 9 / 5) + 32;
}
// Convierte Fahrenheit a Celsius
static int fahrenheitToCelsius(double fahrenheit) {
return ((fahrenheit - 32) * 5 / 9).toInt();
}
// Obtiene ícono según condición
static String getWeatherIcon(String condition) {
switch (condition.toLowerCase()) {
case 'sunny':
return Icons.sunny.toString();
case 'cloudy':
return Icons.cloud.toString();
case 'rainy':
return Icons.wb_sunny.toString();
case 'snowy':
return Icons.snowing.toString();
default:
return Icons.error.toString();
}
}
// Valida temperatura (está en rango válido)
static bool isValidTemperature(int temp) {
return temp >= -50 && temp <= 60;
}
}