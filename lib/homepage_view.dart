import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homepage_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomepageContoller());
    return Scaffold(
      appBar: AppBar(title:const Text(""),),
      body: Obx(
            () => controller.isLoading.value
            ? const Center(child:  CircularProgressIndicator())
            : ListView.builder(
          itemCount: controller.userData.value.data!.length,
          itemBuilder: (context,int index){
            return Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Card(
                color: Theme.of(context).primaryColor,
                child: ListTile(
                  title: Text(
                    '${controller.userData.value.data?[index].firstName!}  ${controller.userData.value.data?[index].lastName!}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '${controller.userData.value.data?[index].email}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(controller.userData.value.data![index].avatar.toString()),
                  ),
                ),
              ),
            );
          }),
      ),
    );
  }
}