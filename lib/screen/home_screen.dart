import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/services/api_servise.dart';
import 'package:health/services/user_service.dart';

import '../model/api_model.dart';

class home_scrren extends StatefulWidget {
  const home_scrren({super.key});

  @override
  State<home_scrren> createState() => _home_scrrenState();
}

class _home_scrrenState extends State<home_scrren> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetApiService.apiservice(),
      builder: (context, AsyncSnapshot<List<Model>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Center(
                      child: Text(
                    'Main Page',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'id:-',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  snapshot.data![index].id.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'name:-',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  snapshot.data![index].name.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'username:-',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  snapshot.data![index].username.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'email:-',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  snapshot.data![index].email.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return const Center(
              child: CupertinoActivityIndicator(
            color: Colors.black,
            radius: 15,
          ));
        }
      },
    );
  }
}
