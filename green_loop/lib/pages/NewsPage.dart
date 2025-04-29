import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  final List<Map<String, dynamic>> featuredNews = [
    {
      'image': 'assets/images/news1.jpg',
      'title': 'New Recycling Stations Set for Dubai',
      'url': 'https://gulfnews.com/uae/environment/15-new-recycling-stations-set-for-dubai-1.1585059'
    },
    {
      'image': 'assets/images/news2.jpg',
      'title': 'Dubai Introduces Reverse Vending Machines for Plastic Bottles',
      'url': 'https://gulfnews.com/uae/watch-dubai-to-recycle-3-million-plastic-bottles-into-uniform-for-municipal-workers-1.100107748'
    },
    {
      'image': 'assets/images/news3.jpg',
      'title': 'Sharjah Launches AI-Enabled Recycling Facility',
      'url': 'https://gulfbusiness.com/sharjahs-beeah-group-launches-ai-enabled-recycling-facility-to-bolster-zero-waste-to-landfill-goals/'
    },
  ];

  final Map<String, List<Map<String, String>>> regionNews = {
    'Dubai': [
      {
        'image': 'assets/images/dubai1.jpg',
        'title': 'Landmark Group Unveils Textile Recycling Facility',
        'date': 'Dec 10, 2024',
        'url': 'https://apparelresources.com/business-news/sustainability/middle-easts-first-textile-recycling-facility-unveiled-landmark-group-dubai/'
      },
      {
        'image': 'assets/images/dubai2.jpg',
        'title': 'Earn Shopping Discounts by Recycling',
        'date': 'Nov 27, 2024',
        'url': 'https://www.khaleejtimes.com/uae/environment/discounts-for-recycling-uae'
      },
    ],
    'Abu Dhabi': [
      {
        'image': 'assets/images/abudhabi1.jpg',
        'title': 'Mobility Program Exchanges Bottles for Bus Trips',
        'date': 'Aug 22, 2024',
        'url': 'https://sustainabledevelopment.un.org/partnership/?p=29519'
      },
      {
        'image': 'assets/images/abudhabi2.jpg',
        'title': 'Tadweer Strengthens Aluminium Recycling Efforts',
        'date': 'Jul 22, 2024',
        'url': 'https://www.zawya.com/en/press-release/tadweer-recycling-initiative'
      },
    ],
    'Sharjah': [
      {
        'image': 'assets/images/sharjah1.jpg',
        'title': '“Clean UAE” Campaign Reaches Sharjah',
        'date': 'Dec 12, 2024',
        'url': 'https://gulfnews.com/uae/environment/clean-uae-campaign-sharjah'
      },
      {
        'image': 'assets/images/sharjah2.jpg',
        'title': 'BE’AH Launches AI-Enabled Recycle Facility',
        'date': 'Oct 4, 2022',
        'url': 'https://gulfbusiness.com/beah-group-ai-recycling-facility/'
      },
    ],
    'Ras Al Khaimah': [
      {
        'image': 'assets/images/rak1.jpg',
        'title': 'Sparko Expands RAK Operations',
        'date': 'Nov 5, 2024',
        'url': 'https://m.tradearabia.com/touch/article/CONS/428170'
      },
      {
        'image': 'assets/images/rak2.jpg',
        'title': 'Biggest Recycling Plant Opens in RAK',
        'date': 'Nov 27, 2019',
        'url': 'https://www.zawya.com/en/business/environment/biggest-recycling-plant-in-rak'
      },
    ],
  };

  Future<void> _openUrlWithLoading(BuildContext context, String url) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(color: Colors.green),
      ),
    );
    await Future.delayed(Duration(seconds: 1));
    Navigator.pop(context); // Close the loading dialog
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3D8A8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB3D8A8),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'GreenLoop News',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.newspaper, color: Colors.black87),
              SizedBox(width: 8),
              const Text(
                'Top Headlines',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: featuredNews.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final item = featuredNews[index];
                return GestureDetector(
                  onTap: () => _openUrlWithLoading(context, item['url']),
                  child: AnimatedOpacity(
                    opacity: 1.0,
                    duration: Duration(milliseconds: 800),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              item['image'],
                              width: 180,
                              height: 220,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: 180,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.transparent
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            child: Text(
                              item['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          ...regionNews.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.place, color: Colors.black87),
                    SizedBox(width: 8),
                    Text(
                      entry.key,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ...entry.value.map((article) {
                  return GestureDetector(
                    onTap: () => _openUrlWithLoading(context, article['url']!),
                    child: AnimatedOpacity(
                      opacity: 1.0,
                      duration: Duration(milliseconds: 700),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        elevation: 4,
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              article['image']!,
                              width: 55,
                              height: 55,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            article['title']!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          subtitle: Text(
                            article['date']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                const SizedBox(height: 20),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
