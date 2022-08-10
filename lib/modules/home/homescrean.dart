import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Amr Awni',
        ),
        actions: [
          Icon(
            Icons.search,
            size: 30,
          ),
          Icon(
            Icons.more_vert,
            size: 30,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const Image(
                    image: NetworkImage(
                      'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/295377858_2262389023910661_1011439396868960907_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFxFxBSsYF36wwIlrBtvVnxMwcz4IVIJ8UzBzPghUgnxSO4bK6uSRH7IaOeKqfaVe-H0X4zBFgMWVS1_ySt_HSV&_nc_ohc=53imZvuXyRMAX9VylOA&tn=1vOM8Ut_iz7xz_Z2&_nc_ht=scontent-hbe1-1.xx&oh=00_AT9dKVAQ_1eHxEZz06FNNR19ZFBNZjExhbFOV-lApsThgg&oe=62DF04A7',
                    ),
                    width: 200.0,
                    height: 200.0,
                  ),
                  Container(
                    // width: 200.0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 3.0,
                    ),
                    color: Colors.black.withOpacity(0.5),
                    child: const Text(
                      'Amr Awni',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
