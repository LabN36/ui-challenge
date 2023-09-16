import 'package:flutter/material.dart';
import 'data.dart';

class YTComponent {
  static SliverAppBar mainAppBar(
      double width, BoxDecoration tagDecorationWithGradient) {
    return SliverAppBar(
      snap: true,
      floating: true,
      elevation: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Container(
        width: width,
        height: 56,
        decoration: tagDecorationWithGradient,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset('assets/logo/ytlogo.png'),
                ),
                const Text(
                  'Music',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.search),
                SizedBox(width: 16),
                Icon(Icons.account_circle),
                SizedBox(width: 8),
              ],
            )
          ],
        ),
      ),
    );
  }

  static Widget tagListWidget() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: YTData.musicTags.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(26, 26, 26, 1),
              border: Border.all(
                width: 1,
                color: const Color.fromRGBO(45, 45, 45, 1),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Center(
            child: Text(
              YTData.musicTags[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }

  static Container itemInfoRow(InfoHeader header) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              if (header.imagePath.isNotEmpty) itemInfoAvtar(header.imagePath),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (header.subHeadMessage.isNotEmpty)
                    subHead(header.subHeadMessage),
                  if (header.headMessage.isNotEmpty)
                    heading(header.headMessage),
                ],
              ),
            ],
          ),
          if (header.actionButtonMessage.isNotEmpty)
            actionButton(header.actionButtonMessage)
        ],
      ),
    );
  }

  static Container itemInfoAvtar(String imagePath) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 48,
      width: 48,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Image.network(
        imagePath,
        alignment: Alignment.center,
        fit: BoxFit.fill,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  static Container actionButton(String actionButtonMessage) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(32)),
      ),
      child: Text(
        actionButtonMessage,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  static Text heading(String bottomMessage) {
    return Text(
      bottomMessage,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Text subHead(String topMessage) {
    return Text(
      topMessage,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: const TextStyle(
        color: Color.fromRGBO(170, 170, 170, 1),
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static Widget gridItemWidget(MusicItem item, double itemSize,
      [double? gridWidth]) {
    const double itemBorderRadius = 8;

    return Container(
      margin: const EdgeInsets.only(right: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: gridWidth ?? itemSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gridImage(itemSize, itemBorderRadius, item, gridWidth),
                Text(
                  item.containerName,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Container gridImage(
      double itemSize, double itemBorderRadius, MusicItem item,
      [double? gridWidth]) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      height: itemSize,
      width: gridWidth ?? itemSize,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(itemBorderRadius),
        ),
      ),
      child: Image.network(
        item.imageLabel,
        alignment: Alignment.center,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  static gridList({
    required List<MusicItem> data,
    required double gridSize,
    double? gridWidth,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: data
          .map((e) => YTComponent.gridItemWidget(e, gridSize, gridWidth))
          .toList(),
    );
  }

  static Row panelHeadingWidget(PanelItem data) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          height: 100,
          width: 100,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(4)),
              gradient: SweepGradient(
                center: Alignment.bottomLeft,
                colors: [Colors.white, Color.fromRGBO(200, 170, 75, 1)],
              )),
          child: Image.network(
            data.headerImage,
            alignment: Alignment.center,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const CircularProgressIndicator();
            },
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              data.subHead1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            Text(
              data.subHead2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            )
          ],
        ),
      ],
    );
  }

  static ListView trendItem(List<MusicItem> data) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.only(bottom: 8, right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(28, 28, 28, 1),
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: trendItemItem(data[index], Icons.more_vert),
      ),
    );
  }

  static Row trendItemItem(MusicItem item, IconData iconData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              height: 50,
              width: 50,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Image.network(
                item.imageLabel,
                alignment: Alignment.center,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const CircularProgressIndicator();
                },
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.containerName,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  item.subHead,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      const TextStyle(color: Color.fromRGBO(170, 170, 170, 1)),
                )
              ],
            )
          ],
        ),
        IconButton(
          onPressed: () => {},
          icon: Icon(iconData),
          color: Colors.white,
        )
      ],
    );
  }

  static Padding secondBottomSheetHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            'UP NEXT',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          Text(
            'LYRICS',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          Text(
            'RELATED',
            style: TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
    );
  }

  static ListView trackListWidget() {
    final data = YTData.getLikeData().sublist(1);
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4, top: 4),
          child: YTComponent.trendItemItem(data[index], Icons.drag_handle),
        );
      },
    );
  }

  static Column playbackOptionWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.thumb_down,
                color: Colors.white,
              ),
              iconSize: 24,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'This is Track Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'This is singer name detail',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.thumb_up,
                color: Colors.white,
              ),
              iconSize: 24,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const LinearProgressIndicator(
            color: Colors.white,
            backgroundColor: Colors.grey,
            minHeight: 2,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '1:02',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '1:58',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        const SizedBox(height: 16),
        playRowWidget(),
      ],
    );
  }

  static Widget playRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shuffle,
            color: Colors.white,
          ),
          iconSize: 32,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.skip_previous,
                color: Colors.white,
              ),
              iconSize: 32,
            ),
            const SizedBox(width: 16),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(45, 41, 32, 1),
                borderRadius: BorderRadius.all(Radius.circular(48)),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                iconSize: 48,
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.skip_next,
                color: Colors.white,
              ),
              iconSize: 32,
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.repeat,
            color: Colors.white,
          ),
          iconSize: 32,
        ),
      ],
    );
  }

  static Stack songVideoStackWidget() {
    return Stack(
      children: [
        Positioned(
          left: 65,
          width: 90,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 6,
            ),
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: const Text(
              'Video',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
        Positioned(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 6,
            ),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: const Text(
              'Song',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
