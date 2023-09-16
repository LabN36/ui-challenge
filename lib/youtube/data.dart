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
  final String headerImage;
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
    required this.headerImage,
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
      songList: getLikeData().sublist(16, 19),
      headerImage: getLikeData()[15].imageLabel,
    );
  }

  static PanelItem getPanel2() {
    return PanelItem(
      title: 'Sounds from Shorts',
      subHead1: 'YouTube shorts',
      subHead2: '1 songs',
      description: 'Music you saved while watching Short.',
      songList: getLikeData().sublist(7, 8),
      headerImage: getLikeData()[6].imageLabel,
    );
  }

  static List<MusicItem> getLikeData() {
    List<MusicItem> likeData = [];
    likeData.addAll(const [
      MusicItem('Your Likes', '',
          'https://user-images.githubusercontent.com/10628287/268014689-cdf01fde-179d-41a6-a011-34f0444d2046.png'),
      MusicItem('D N Me', 'Dino James',
          'https://user-images.githubusercontent.com/10628287/268014723-e0bacdc6-32cd-4512-9e41-0903653821c1.png'),
      MusicItem('HIIT Desi Pop', 'YouTube Music',
          'https://user-images.githubusercontent.com/10628287/268014705-8adb8082-77ea-4849-b58a-561391da434c.png'),
      MusicItem("N'y pense plus", 'Tayc',
          'https://github.com/LabN36/ui-challenge/assets/10628287/b25ad8ea-e36d-4df9-b9a9-afae52e63edd'),
      //5
      MusicItem('Bollywood Essentials', 'Trap Music',
          'https://github.com/LabN36/ui-challenge/assets/10628287/f0b20aab-e806-4cd8-bc7a-724dfaecb891'),
      MusicItem('Martin Garrix radio', 'YouTube Music',
          'https://github.com/LabN36/ui-challenge/assets/10628287/f547d9ea-c0d6-48e1-98b6-4a0624e4d2d7'),
      MusicItem('Electronic radio', 'YouTube Music',
          'https://github.com/LabN36/ui-challenge/assets/10628287/d50f2183-7b50-409b-87c0-d942ee80c911'),
      MusicItem('No Reason', 'PARMISH VERMA & GD 47',
          'https://user-images.githubusercontent.com/10628287/268014711-f8693bbf-3a2a-4b58-abfb-aa30e87200e2.png'),
      MusicItem('Hollywood radio Pump up', 'Hollywood Radio',
          'https://github.com/LabN36/ui-challenge/assets/10628287/0b28bede-d16f-4f58-b198-6364fec39176'),
      //10
      MusicItem('Dance Hits', 'The Biggest Dance',
          'https://github.com/LabN36/ui-challenge/assets/10628287/5771f464-b0b6-4400-965b-0314e99385b6'),
      //11
      MusicItem('Bad Boy (feat. Luana)', 'Tungevaag & Raaban',
          'https://github.com/LabN36/ui-challenge/assets/10628287/2ee0060f-3934-40c8-921c-f0bf868c9d4e'),
      MusicItem('Lean On(feat. MO)', 'Major Lazer & DJ Snake',
          'https://github-production-user-asset-6210df.s3.amazonaws.com/10628287/268020593-16e105e9-dc11-4f11-9a13-8f320585a412.png'),
      MusicItem('One More Night', 'Maroon 5',
          'https://github.com/LabN36/ui-challenge/assets/10628287/84c75dce-42b3-49d6-ba7b-6a19ba7d77ff'),
      MusicItem('Know You Want Me', 'Pitbull',
          'https://github-production-user-asset-6210df.s3.amazonaws.com/10628287/268020617-df6a8eaf-a2e0-42f9-8719-0a034cf498f1.png'),
      //15
      MusicItem('Right Now (Na Na Na)', 'Akon',
          'https://github-production-user-asset-6210df.s3.amazonaws.com/10628287/268020623-59a3b7f5-0fa8-4aa5-b78a-d4a53f1e75fe.png'),
//16 index 15
      MusicItem('Pop & Indie Easy Listening', 'Playlist YouTube Music',
          'https://github.com/LabN36/ui-challenge/assets/10628287/499bcab9-bccb-485f-bd31-dd1c82773b76'),
      MusicItem('Pop Ballads', 'Playlist YouTube Music',
          'https://github-production-user-asset-6210df.s3.amazonaws.com/10628287/268020629-90fbbf8d-fb85-4c74-9917-2cb02052346a.png'),
      MusicItem('Let Me Down Slowly', 'Alec Benjamin',
          'https://github.com/LabN36/ui-challenge/assets/10628287/6fef5651-ada3-42e2-8b90-0ff8312d8f21'),
      //total 19 index 18
      MusicItem('Unstoppable', 'Sia',
          'https://github-production-user-asset-6210df.s3.amazonaws.com/10628287/268020637-5e0d3be5-7b97-4a8b-bb80-c0d74c59f98a.png'),

      ///
      // 20 index 19
      MusicItem('Stitches', 'Shawn Mendes',
          'https://github.com/LabN36/ui-challenge/assets/10628287/ed42903e-3f59-422c-9622-98f9233ba84f'),
      MusicItem('Perfect', 'Ed Sheeran',
          'https://github.com/LabN36/ui-challenge/assets/10628287/cd11582e-b72a-4df8-9fec-3392f8f47ed3'),
      MusicItem('Dance Monkey', 'Tones And I',
          'https://github.com/LabN36/ui-challenge/assets/10628287/61e5cf35-e0e5-4070-bec5-f7d883c0cbf1'),
      MusicItem('Ignite (feat. Seungri)', 'K-391',
          'https://github.com/LabN36/ui-challenge/assets/10628287/45e7feb6-fda5-4d4f-b4e9-75c98bd2fb73'),
      MusicItem('Numb', 'Linkin Park',
          'https://github.com/LabN36/ui-challenge/assets/10628287/95b0068b-0342-464e-925a-a965c8af2602'),
      //25
      MusicItem('Titanium (feat. Sia)', 'David Guetta',
          'https://github.com/LabN36/ui-challenge/assets/10628287/2159bd10-c5ef-4c0a-b657-e1dc6c828604'),
      MusicItem('Hymm for the Weekend', 'Coldplay',
          'https://github.com/LabN36/ui-challenge/assets/10628287/e24a87e0-5fe6-4409-9178-5ea5851936f2'),
      MusicItem('Counting Start', 'OneRepublic',
          'https://github.com/LabN36/ui-challenge/assets/10628287/4ed6f417-bf5d-4e4e-80b4-6fc9ba7f3672'),
      MusicItem('Dark Horse(feat. Juicy J)', 'Katy Perry',
          'https://github.com/LabN36/ui-challenge/assets/10628287/7c368948-5826-4846-942f-b1b5de3ad375'),
      //29 index 28
      MusicItem('Believer', 'Imagnine Dragons',
          'https://github.com/LabN36/ui-challenge/assets/10628287/a2a275e7-3dfa-47f1-abba-95f45389ec09')
    ]);
    return likeData;
  }
}
