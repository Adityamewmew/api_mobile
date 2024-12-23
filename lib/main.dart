import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Crypto Tracker",
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> cryptos = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchCryptos();
  }
  Future<void> fetchCryptos() async {
    final data = await ApiService().fetchCryptos();
    setState(() {
      cryptos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredCryptos = cryptos.where((crypto) {
      return crypto['name'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto Tracker"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) => setState(() => searchQuery = query),
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: filteredCryptos.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: filteredCryptos.length,
              itemBuilder: (context, index) {
                final crypto = filteredCryptos[index];
                return ListTile(
                  leading: Image.network(crypto['image'], width: 50, height: 50),
                  title: Text(crypto['name']),
                  subtitle: Text('Price: \$${crypto['current_price']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
