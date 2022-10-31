import 'package:flutter/material.dart';
import 'package:interview_rest/providers/country_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<CountryProvider>(
          builder: (context, value, child) =>
              Text('Countries (${value.length})'),
        ),
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: () {
            return context.read<CountryProvider>().getAllCountryInfo();
          },
          child: Consumer<CountryProvider>(
            builder: (context, countryProvider, child) {
              return countryProvider.countries.isEmpty
                  ? const Text('No data found')
                  : ListView.builder(
                      itemCount: countryProvider.countries.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.network(
                              countryProvider.countries[index].image!,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.broken_image,
                                  size: 35,
                                );
                              },
                            ),
                          ),
                          title:
                              Text(countryProvider.countries[index].countryName!),
                        );
                      },
                    );
            },
          ),
        ),
      ),
    );
  }
}
