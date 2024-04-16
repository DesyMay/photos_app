import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photos_app/config/app_icon.dart';
import 'package:photos_app/features/home/controllers/home_controller.dart';
import 'package:photos_app/features/home/models/image_model.dart';
import '../../../const/app_text.dart';
import '../widgets/photo_detail_page.dart';
import '../widgets/photo_preview.dart';
import '../widgets/state_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppText.homeTitle),
      ),
      body: FutureBuilder(
        future: controller.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: FittedBox(
                child: Text(
                  AppText.dataFetchError,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: width / 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) {
                  final ImageModel item = snapshot.data![index];
                  return Column(
                    children: [
                      PhotoPreview(
                        item: item,
                        tag: item.largeImageURL ?? '',
                        size: (width / 2) - 50.0,
                        onTap: () {
                          Get.to(
                            () => PhotoDetailPage(
                              photo: item.largeImageURL ?? '',
                            ),
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          StatBanner(
                            icon: AppIcons.like,
                            title: item.likes.toString(),
                          ),
                          StatBanner(
                            icon: AppIcons.view,
                            title: item.views.toString(),
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
