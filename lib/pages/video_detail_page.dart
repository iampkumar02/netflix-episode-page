import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

const List<String> seasons_list = <String>[
  'Season 1',
  'Season 2',
  'Season 3',
  'Season 4',
  'Season 5',
  'Season 6'
];

const List likesList = [
  {"icon": Icons.add, "text": "My List"},
  {"icon": Icons.thumb_up_alt_outlined, "text": "Rate"},
  {"icon": Icons.share, "text": "Share"},
  {"icon": Icons.download, "text": "Download\n Season 6"},
];
const List episodesList = ["Episodes", "More Like This"];

const List movieList = [
  {
    "img": "assets/images/details_1.jpg",
    "title": "1. Solaricks",
    "description":
        "They're back... and right where we left 'em. Without a portal gun, Rick and Morty are stranded as they float through space in the ruins of the Citadel.",
    "duration": "22m"
  },
  {
    "img": "assets/images/details_2.jpg",
    "title": "2. Seizing Power",
    "description":
        "When alien terrorists take over video arcade Blips and Chitz, Rick asks Summer to help him out by channeling \"Die Hard,\" a movie the teen's never seen.",
    "duration": "22m"
  },
  {
    "img": "assets/images/details_3.jpg",
    "title": "3. The Demon King",
    "description":
        "As Beth takes the concept of self-love in a bold new direction on Thanksgiving, Morty and Summer self-soothe by playing a realistic video game.",
    "duration": "22m"
  },
  {
    "img": "assets/images/details_4.jpg",
    "title": "4. Complete Control",
    "description":
        "When Beth sees Rick doing crunches late at night, the family learns he has a device that programs his sleeping body to get stuff done — and they want in.",
    "duration": "21m"
  },
  {
    "img": "assets/images/details_5.jpg",
    "title": "5. Final DeSmithation",
    "description":
        "When Jerry's fortune cookie reveals a fate worse than death, Rick decides to get to the bottom of the dessert's shocking prediction.",
    "duration": "23m"
  },
  {
    "img": "assets/images/details_6.jpg",
    "title": "6. JuRicksic Mort",
    "description":
        "Earth's original rulers return with questions — and concerns — about how things are going, spurring Rick to find a way to stop their sweeping changes.",
    "duration": "21m"
  },
];

class VideoDetailPage extends StatefulWidget {
  final String videoUrl;

  const VideoDetailPage({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  int activeEpisode = 0;
  late VideoPlayerController _controller;
  String dropdownValue = seasons_list[5];

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized.
        setState(() {
          // Start playing the video.
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    // Ensure to dispose of the video controller to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            // Navigator.pop(context);
          }),
      actions: [
        IconButton(
            icon: const Icon(
              Icons.search,
              size: 28,
            ),
            onPressed: () {}),
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          _controller.value.isInitialized
              ? Container(
                  height: 220,
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2))),
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? null
                                  : Icons.play_arrow,
                              size: 50,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        left: 5,
                        bottom: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                right: 13, left: 13, top: 8, bottom: 8),
                            child: Row(
                              children: [
                                Text(
                                  "Preview",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        bottom: 20,
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: const Center(
                            child: Icon(
                              Icons.volume_mute,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  height: 220,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/details_1.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
          Container(
            height: size.height - 320,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rick and Morty",
                      style: TextStyle(
                          height: 1.4,
                          fontSize: 28,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "2022",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.white.withOpacity(0.2)),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 6, right: 6, top: 4, bottom: 4),
                            child: Text(
                              "A",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "6 Season",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                  width: 2,
                                  color: Colors.white.withOpacity(0.2))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 4, right: 4, top: 2, bottom: 2),
                            child: Text(
                              "HD",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(
                          FeatherIcons.messageSquare,
                          color: Colors.white.withOpacity(0.8),
                          // size: 48,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "New episode coming on Monday",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: size.width,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Play",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: size.width,
                      height: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey.withOpacity(0.3)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_download,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Download",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "S6:E1",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "S1:E1 Solaricks",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (size.width - 30) * 0.75,
                          child: Stack(
                            children: [
                              Container(
                                width: (size.width - 30) * 0.75,
                                height: 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.withOpacity(0.5)),
                              ),
                              Container(
                                width: (size.width - 30) * 0.2,
                                height: 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.red.withOpacity(0.8)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Considered a fool and unfit to lead, Nobunaga rises to power as the head of the Oda clan, spurring dissent among those in his family vying for control.",
                      style: TextStyle(
                          height: 1.4, color: Colors.white.withOpacity(0.9)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Starring: Justin Roiland,Chris Parnell,Spencer Grammer",
                      style: TextStyle(
                          fontSize: 13,
                          height: 1.4,
                          color: Colors.grey.withOpacity(0.9)),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Creators: Dan Harmon,Justin Roiland",
                      style: TextStyle(
                          fontSize: 13,
                          height: 1.4,
                          color: Colors.grey.withOpacity(0.9)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: List.generate(likesList.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Column(
                              children: [
                                Icon(
                                  likesList[index]['icon'],
                                  size: 25,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(likesList[index]['text'],
                                    style: TextStyle(
                                        fontSize: 12,
                                        height: 1.4,
                                        color: Colors.grey.withOpacity(0.9)))
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(episodesList.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                activeEpisode = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                width: 4,
                                                color: activeEpisode == index
                                                    ? Colors.red
                                                        .withOpacity(0.8)
                                                    : Colors.transparent))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(
                                        episodesList[index],
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: activeEpisode == index
                                                ? Colors.white.withOpacity(0.9)
                                                : Colors.white.withOpacity(0.5),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 43, 42, 42), //<-- SEE HERE
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          selectedItemBuilder: (BuildContext context) {
                            return seasons_list.map((String value) {
                              return Text(
                                dropdownValue,
                                style: const TextStyle(color: Colors.white),
                              );
                            }).toList();
                          },
                          iconSize: 13,
                          items: seasons_list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(movieList.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: (size.width - 30) * 0.85,
                                    height: 100,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 150,
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 150,
                                                height: 90,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            movieList[index]
                                                                ['img']),
                                                        fit: BoxFit.cover)),
                                              ),
                                              Container(
                                                width: 150,
                                                height: 90,
                                                decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.3)),
                                              ),
                                              Positioned(
                                                top: 30,
                                                left: 57,
                                                child: Container(
                                                  width: 38,
                                                  height: 38,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          width: 2,
                                                          color: Colors.white),
                                                      color: Colors.black
                                                          .withOpacity(0.4)),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.play_arrow,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: (size.width) * 0.35,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  movieList[index]['title'],
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      height: 1.3,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white
                                                          .withOpacity(0.9)),
                                                ),
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  movieList[index]['duration'],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white
                                                          .withOpacity(0.5)),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: (size.width - 30) * 0.15,
                                    height: 100,
                                    child: Center(
                                      child: Icon(
                                        Icons.file_download,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                movieList[index]['description'],
                                style: TextStyle(
                                    height: 1.4,
                                    color: Colors.white.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
