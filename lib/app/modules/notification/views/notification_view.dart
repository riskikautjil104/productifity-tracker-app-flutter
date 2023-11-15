import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

import '../../../widgets/navbarAppBar.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> items = [
      {
        'name': 'Ucup Krucup',
        'notification': 'buatkan halaman home dan halaman project',
        'image':
            'https://media.istockphoto.com/id/1252210017/id/foto/gadis-tersenyum-bermain-di-ayunan.webp?s=1024x1024&w=is&k=20&c=bWY91_9uM-lw0cO73xR8sEjsJmRJIso88OW7_BmBKC8=',
        'timeSent': '5 minutes ago',
      },
      {
        'name': 'Otong Surotong',
        'notification': 'Buatkan halaman Statistik ',
        'image':
            'https://media.istockphoto.com/id/1320654945/id/foto/anak-laki-laki-bermain-dengan-ibu.jpg?s=1024x1024&w=is&k=20&c=CyiymZ58NhpcICH1WXaKJf0GIm_sIk9voRSfh87YHGY=',
        'timeSent': '10 minutes ago',
      },
      {
        'name': 'Otong Surotong',
        'notification': 'Buatkan halaman Statistik ',
        'image': 'assets/profile_image.png',
        'timeSent': '10 minutes ago',
      },
      {
        'name': 'Otong Surotong',
        'notification': 'Buatkan halaman Statistik ',
        'image': 'assets/profile_image.png',
        'timeSent': '10 minutes ago',
      },
    ];
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          'Notification',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        gradient: LinearGradient(
          colors: [
            Color(0xFF197391),
            Color(0xFF0F9EEA),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index]['name']!),
            onDismissed: (direction) {
              Get.defaultDialog(
                title: 'Konfirmasi',
                middleText: 'Apakah Anda yakin untuk menghapus item ini?',
                textConfirm: 'Accept',
                textCancel: 'Cancel',
                confirmTextColor:
                    Colors.green, // Warna teks untuk tombol konfirmasi
                cancelTextColor: Colors.red,
                onConfirm: () {
                  // Tambahkan logika penghapusan item di sini
                  items.removeAt(index);
                  Get.back(); // Menutup dialog setelah mengonfirmasi penghapusan
                },
                onCancel: () {
                  Get.back(); // Menutup dialog ketika membatalkan penghapusan
                },
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Item dihapus')),
              );
            },
            background: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFFF0000),
                ),
                alignment: Alignment.centerRight,
                height: 59, // Sesuaikan dengan tinggi yang diinginkan
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0XFFBCE0FD),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    // child: Image.network(
                    //     'https://media.istockphoto.com/id/1252210017/id/foto/gadis-tersenyum-bermain-di-ayunan.webp?s=1024x1024&w=is&k=20&c=bWY91_9uM-lw0cO73xR8sEjsJmRJIso88OW7_BmBKC8='),
                    // backgroundImage: Image.network(items[index] ['image']!),
                    backgroundImage: NetworkImage(items[index]['image']!),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[index]['name']!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          items[index]['timeSent']!,
                          style: TextStyle(
                            color: Color(0XFFB9B9B9),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          items[index]['notification']!,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
