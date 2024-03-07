import 'package:flutter/material.dart';

class AppBarCom extends StatelessWidget {
  const AppBarCom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,right: 15,left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () {
                // Tambahkan logika untuk menangani aksi ketika ikon diklik di sini
              },
              icon: Icon(
                Icons.menu, // Ikon menu bawaan Flutter
                color: Colors.white, // Atur warna ikon menjadi putih
              ),
            ),
          ),
          Image(
            image: AssetImage('assets/images/ic_text.png'),
          ),
        ],
      ),
    );
  }
}
