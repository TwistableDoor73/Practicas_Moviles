import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
class HomeScreen extends StatefulWidget {
const HomeScreen({Key? key}) : super(key: key);
@override
State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
@override
void initState() {
super.initState();
// Carga datos al abrir
Provider.of<WeatherProvider>(context, listen: false).loadWeather('Santiago');
}
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Climate')),
body: Consumer<WeatherProvider>(
builder: (context, weather, _) {
if (weather.isLoading) {
return const Center(child: CircularProgressIndicator());
}
if (weather.errorMessage != null) {
return Center(child: Text('Error: ${weather.errorMessage}'));
}
if (weather.weather == null) {
return const Center(child: Text('No data'));
}
return Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
'${weather.weather!.temperature}${weather.temperatureUnit}',
style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
),
Text(weather.weather!.city),
Text('Humidity: ${weather.weather!.humidity}%'),
ElevatedButton(
onPressed: () => weather.toggleTemperatureUnit(),
child: const Text('Cambiar unidad'),
),
],
),
);
},
),
);
}
}