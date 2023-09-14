import 'package:flutter/material.dart';

import 'data.dart';
import 'youtube_component.dart';

class YTListItem {
  //

  static Widget listMultiGrid() {
    final data = YTData.getLikeData();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        YTComponent.itemInfoRow(InfoHeader(
          imagePath: 'https://cataas.com/cat?type=sm',
          subHeadMessage: 'RISHABH AGRAWAL',
          headMessage: 'Listen again',
          actionButtonMessage: 'More',
        )),
        ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: Container(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
            child: SingleChildScrollView(
              physics: const PageScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YTComponent.gridList(data: data.sublist(0, 5), gridSize: 100),
                  const SizedBox(height: 8),
                  YTComponent.gridList(
                      data: data.sublist(5, 10), gridSize: 100),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget listSingleGrid(SingleGridItem singleGridItem,
      {required double gridSize, required double gridWidth}) {
    final data = YTData.getLikeData();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        YTComponent.itemInfoRow(singleGridItem.header),
        ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: Container(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
            child: SingleChildScrollView(
              physics: const PageScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YTComponent.gridList(
                      data: data.sublist(0, 5),
                      gridSize: gridSize,
                      gridWidth: gridWidth),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget listPanel(PanelItem data) {
    return Container(
      decoration: const BoxDecoration(
        gradient: SweepGradient(
          center: Alignment.bottomLeft,
          colors: [Colors.white, Color.fromRGBO(21, 18, 9, 1)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YTComponent.panelHeadingWidget(data),
          Text(
            data.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ...data.songList.map(
            (e) => Column(
              children: [
                YTComponent.trendItemItem(e, Icons.more_vert),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(45, 41, 32, 1),
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_arrow,
                    )),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  border: Border.all(
                      color: Colors.white, strokeAlign: StrokeAlign.inside),
                ),
                child: IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.radio,
                    )),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  border: Border.all(
                      color: Colors.white, strokeAlign: StrokeAlign.inside),
                ),
                child: IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.my_library_music_rounded,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  static Widget listCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: YTComponent.itemInfoRow(
            InfoHeader(
              subHeadMessage: 'FOR YOU',
              headMessage: 'Trending songs',
              actionButtonMessage: 'Play all',
              imagePath: '',
            ),
          ),
        ),
        Container(
          //TODO:(how do we make this dynamic height)
          constraints: const BoxConstraints(
            minHeight: 100,
            maxHeight: 315,
          ),
          child: PageView(
            controller: PageController(
              viewportFraction: 0.90,
            ),
            scrollBehavior: CustomScrollBehavior(),
            children: [
              YTComponent.trendItem(),
              YTComponent.trendItem(),
              YTComponent.trendItem(),
              YTComponent.trendItem(),
              YTComponent.trendItem(),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
