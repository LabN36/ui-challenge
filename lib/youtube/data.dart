class InfoHeader {
  final String headMessage;
  final String subHeadMessage;
  final String actionButtonMessage;
  final String imagePath;

  InfoHeader({
    this.headMessage = '',
    this.subHeadMessage = '',
    this.actionButtonMessage = '',
    this.imagePath = '',
  });
}

class SingleGridItem {
  final InfoHeader header;

  SingleGridItem({
    required this.header,
  });
}

class PanelItem {
  final String title;
  final String subHead1;
  final String subHead2;
  final String description;
  final List<MusicItem> songList;

  PanelItem({
    required this.title,
    required this.subHead1,
    required this.subHead2,
    required this.description,
    required this.songList,
  });
}

class MusicItem {
  final String containerName;
  final String subHead;
  final String imageLabel;
  const MusicItem(this.containerName, this.subHead, this.imageLabel);
}

class YTData {
  static List<String> musicTags = [
    'Relax',
    'Workout',
    'Commute',
    'Energize',
    'Focus'
  ];
  static PanelItem getPanel1() {
    return PanelItem(
        title: 'Punjabi Party',
        subHead1: 'YouTube Music',
        subHead2: '100 songs',
        description:
            'Rock the dance floor with these hit Pubjabi songs. \nPress play and party hard. #punjabi #dance #party',
        songList: getSongListWithDescription().sublist(0, 3));
  }

  static PanelItem getPanel2() {
    return PanelItem(
        title: 'Sounds from Shorts',
        subHead1: 'User Name',
        subHead2: '1 songs',
        description: 'Music you saved while watching Short.',
        songList: getSongListWithDescription().sublist(0, 1));
  }

  static List<MusicItem> getSongListWithDescription() {
    List<MusicItem> likeData = [];
    likeData.addAll(const [
      MusicItem('Item 1', 'description 1', 'https://cataas.com/cat?type=sm'),
      MusicItem('Item 2', 'description 2', 'https://cataas.com/cat?type=sm'),
      MusicItem('Item 3', 'description 3', 'https://cataas.com/cat?type=sm'),
      MusicItem('Item 4', 'description 4', 'https://cataas.com/cat?type=sm'),
      MusicItem('Item 5', 'description 5', 'https://cataas.com/cat?type=sm'),
    ]);
    return likeData;
  }

  static List<MusicItem> getLikeData() {
    List<MusicItem> likeData = [];
    likeData.addAll(const [
      MusicItem('Item 1', '', 'https://cataas.com/cat?type=sm'),
      MusicItem('Item 2', '', 'https://cataas.com/cat?type=sm'),
      MusicItem('Item 3', '', 'https://cataas.com/cat?type=sm'),
      MusicItem('Item 4', '', 'https://cataas.com/cat?type=sm'),
      MusicItem('Item 5', '', 'https://cataas.com/cat?type=sm'),
      MusicItem('Item 6', '', 'https://cataas.com/cat?type=sm'),
      MusicItem('Item 7', '', 'https://cataas.com/cat?type=sm'),
      MusicItem('Item 8', '', 'https://cataas.com/cat?type=sm'),
      MusicItem('Item 9', '', 'https://cataas.com/cat?type=sm'),
      MusicItem('Item 10', '', 'https://cataas.com/cat?type=sm'),
    ]);
    return likeData;
  }
}
