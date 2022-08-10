import 'package:flutter/material.dart';

class messengerScreen extends StatelessWidget {
  const messengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 20,
        elevation: 0.0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage(
                'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-6/295377858_2262389023910661_1011439396868960907_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFxFxBSsYF36wwIlrBtvVnxMwcz4IVIJ8UzBzPghUgnxSO4bK6uSRH7IaOeKqfaVe-H0X4zBFgMWVS1_ySt_HSV&_nc_ohc=53imZvuXyRMAX9VylOA&tn=1vOM8Ut_iz7xz_Z2&_nc_ht=scontent-hbe1-1.xx&oh=00_AT9dKVAQ_1eHxEZz06FNNR19ZFBNZjExhbFOV-lApsThgg&oe=62DF04A7',
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.camera_alt,
                  size: 16.0,
                  color: Colors.black,
                ),
              )),
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.edit,
                  size: 16.0,
                  color: Colors.black,
                ),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                height: 35.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                        'Search',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,items)=>buildStatusItem(),
                  separatorBuilder: (context,items)=>SizedBox(width: 10.0,),
                  itemCount: 12,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
               ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context ,items)=>buildChatsItem(),
                    separatorBuilder: (context ,items)=>SizedBox(height: 10.0,),
                    itemCount: 20
                ),
            ],
          ),
        ),
      ),

    );
  }

  Widget buildStatusItem() => Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: const [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-1/236827653_824641214862363_4858162077436149080_n.jpg?stp=dst-jpg_s200x200&_nc_cat=100&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeFj4TtUmhs58ujWAIdiGgAmxWfCnL_jcJ3FZ8Kcv-NwnQm7pfJQJfwzyQyisM8EyIUoH23t_Qeez9GS-G_99YpB&_nc_ohc=GvL49gAH30UAX_GEcuf&_nc_ht=scontent.faly1-2.fna&oh=00_AT8Km8FW0SZTAHqbQ87O-cHcL4N3VljlF1brluXEoi11RQ&oe=62E13E57'),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 3.1,
                    end: 3.1,
                  ),
                  child: CircleAvatar(
                    radius: 8.0,
                    backgroundColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 4.0,
                    end: 4.0,
                  ),
                  child: CircleAvatar(
                    radius: 7.0,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 6.0,
            ),
            const Text(
              'mohamed mostafa',
              maxLines: 2,
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      );
  Widget buildChatsItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-1/244551230_4578066998910076_4756726106475184521_n.jpg?stp=dst-jpg_s200x200&_nc_cat=102&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeHBBlwY6wuYUoOFyGU5vxaiXRMFDV-0Z0JdEwUNX7RnQn6ItIfJw9tGrkTkfLN6VQwCePTqRUtjFQ4BdKKTYH9G&_nc_ohc=3wbJ62wJ9TAAX_pmUOC&_nc_ht=scontent.faly1-2.fna&oh=00_AT-TKzt2wV-ugHsNGVLAhoxuwETWbNXVOuDhWvpzf2tibA&oe=62E183AF'),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 3.1,
                  end: 3.1,
                ),
                child: CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 4.0,
                  end: 4.0,
                ),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mahmoud Awni',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Text('ابعتلى الحاجة اللى عندك'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: 5.0,
                        height: 5.0,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const Text(
                      '21:57',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      );
}
