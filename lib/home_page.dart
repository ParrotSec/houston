import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

class Category {
  final int id;
  final String category;

  Category({required this.id, required this.category});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      category: json['category'],
    );
  }
}

Future<List<Category>> _loadData() async {
  final response = await rootBundle.loadString('assets/data.json');
  final List<dynamic> jsonList = json.decode(response);
  return jsonList.map((json) => Category.fromJson(json)).toList();
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(
          title: Row(
            children: [
              const Icon(Icons.add_circle_outline_rounded),
              const SizedBox(width: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Text(
                    "Houston",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ),
            ],
          ),
          titlePadding: const EdgeInsets.only(left: 50),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: SizedBox(),
        ),
      ),
      body: FutureBuilder(
        future: _loadData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.hasData) {
            final categories = snapshot.data!;
            return SizedBox(
              child: GridView.count(
                crossAxisCount: 4,
                children: List.generate(categories.length, (index) {
                  final category = categories[index];
                  return Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    margin: const EdgeInsets.all(24),
                    child: SizedBox(
                      child: GestureDetector(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () => {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 32, horizontal: 24),
                            child: Text(
                              category.category,
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
