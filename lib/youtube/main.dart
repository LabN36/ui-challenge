// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';
import 'data.dart';
import 'youtube_component.dart';
import 'youtube_list.dart';

int step = 1000;

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      debugShowMaterialGrid: false,
      home: HomeWidget(
        previous: 0,
        previousV2: 0,
      ),
    ),
  );
}

class HomeWidget extends StatefulWidget {
  double previous;
  double previousV2;
  HomeWidget({
    Key? key,
    required this.previous,
    required this.previousV2,
  }) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late DraggableScrollableController draggableScrollableController;
  late DraggableScrollableController upNextController;

  late BottomSheetCubit bottomSheetCubit;
  late BottomSheetCubitV2 bottomSheetCubitV2;
  bool isSheetOnTop = false;
  ScrollController likeListController = ScrollController();
  BoxDecoration tagDecorationWithGradient = BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.black, Color.fromARGB(255, 147, 107, 104)],
    ),
  );
  late BoxDecoration tagDecoration;
  @override
  void initState() {
    super.initState();
    tagDecoration = tagDecorationWithGradient;
    bottomSheetCubit = BottomSheetCubit();
    bottomSheetCubitV2 = BottomSheetCubitV2();
    animationController = AnimationController(vsync: this);
    draggableScrollableController = DraggableScrollableController();
    upNextController = DraggableScrollableController();
    likeListController.addListener(() {
      // log(likeListController.offset.toString());
      // if (likeListController.offset > 50) {
      //   setState(() {
      //     tagDecoration = BoxDecoration(
      //       color: Colors.black,
      //     );
      //   });
      // } else if (likeListController.offset < 50) {
      //   setState(() {
      //     tagDecoration = tagDecorationWithGradient;
      //   });
      // }
    });
    draggableScrollableController.addListener(() {
      // 0.094 to 1
      // print('[addListener ${draggableScrollableController.size}]');
      // print('[previous] ${widget.previous}');
      if (draggableScrollableController.isAttached) {
        if (draggableScrollableController.size - widget.previous > (1 / step)) {
          widget.previous = bottomSheetCubit.increv2(
              draggableScrollableController.size, widget.previous);
        } else if (widget.previous - draggableScrollableController.size >
            (1 / step)) {
          widget.previous = bottomSheetCubit.decrev2(
              draggableScrollableController.size, widget.previous);
        }
      }
    });

    upNextController.addListener(() {
      // 0.094 to 1
      // print('[addListener ${draggableScrollableController.size}]');
      // print('[previous] ${widget.previous}');
      if (upNextController.isAttached) {
        if (upNextController.size - widget.previousV2 > (1 / step)) {
          widget.previousV2 = bottomSheetCubitV2.increv2(
              upNextController.size, widget.previousV2);
        } else if (widget.previousV2 - upNextController.size > (1 / step)) {
          widget.previousV2 = bottomSheetCubitV2.decrev2(
              upNextController.size, widget.previousV2);
        }
      }
    });
  }

  List<Widget> _buildList(int count) {
    List<Widget> listItems = [];
    for (int i = 0; i < count; i++) {
      if (i == 0) {
        listItems.add(YTListItem.listMultiGrid());
      } else if (i == 1) {
        listItems.add(
          YTListItem.listSingleGrid(
            SingleGridItem(
              header: InfoHeader(
                headMessage: 'Mixed for you',
                actionButtonMessage: 'More',
              ),
            ),
            gridSize: 150,
            gridWidth: 150,
          ),
        );
      } else if (i == 2) {
        listItems.add(YTListItem.listPanel(YTData.getPanel1()));
      } else if (i == 3) {
        listItems.add(YTListItem.listCarousel());
      } else if (i == 4) {
        listItems.add(YTListItem.listPanel(YTData.getPanel2()));
      } else if (i == 5) {
        listItems.add(YTListItem.listCarousel());
      } else if (i == 6) {
        listItems.add(
          YTListItem.listSingleGrid(
            SingleGridItem(
              header: InfoHeader(
                headMessage: 'Forgotten favorites',
              ),
            ),
            gridSize: 150,
            gridWidth: 150,
          ),
        );
      } else if (i == 7) {
        listItems.add(
          YTListItem.listSingleGrid(
            SingleGridItem(
              header: InfoHeader(
                headMessage: 'Recommended music',
                actionButtonMessage: 'Play all',
              ),
            ),
            gridSize: 150,
            gridWidth: 280,
          ),
        );
      } else if (i == count - 1) {
        listItems.add(SizedBox(height: 200));
      }
    }
    return listItems;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => bottomSheetCubit,
        ),
        BlocProvider(
          create: (context) => bottomSheetCubitV2,
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              CustomScrollView(
                controller: likeListController,
                slivers: [
                  YTComponent.mainAppBar(MediaQuery.of(context).size.width,
                      tagDecorationWithGradient),
                  secondaryAppBar(context),
                  SliverToBoxAdapter(child: SizedBox(height: 10)),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      _buildList(9),
                    ),
                  ),
                ],
              ),
              DraggableScrollableSheet(
                // minChildSize: 0.05,
                minChildSize: 0.145,
                maxChildSize: 1,
                initialChildSize: 0.155,
                expand: true,
                snap: true,
                controller: draggableScrollableController,
                builder: (context, scrollController) {
                  return mainBottomSheet(scrollController, context);
                },
              ),
              Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: bottomNavBar(),
              )
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView mainBottomSheet(
      ScrollController scrollController, BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          GestureDetector(
            onTap: onTapSraggableSheet,
            child: Container(
              height: MediaQuery.of(context).size.height - 15,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromRGBO(33, 33, 33, 1),
              ),
              child: Stack(
                children: [
                  currentMusicWidget(1),
                  Positioned(
                    top: 450,
                    child: BlocBuilder<BottomSheetCubit, BSData>(
                      builder: (context, state) {
                        final castOpacity = ((state.size - 0.65) / (1 - 0.65));
                        return Opacity(
                          opacity: castOpacity < 0 ? 0 : castOpacity,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 8),
                            width: MediaQuery.of(context).size.width,
                            child: YTComponent.playbackOptionWidget(),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 15,
                    child: BlocBuilder<BottomSheetCubit, BSData>(
                      builder: (context, state) {
                        return BlocBuilder<BottomSheetCubitV2, BSDataV2>(
                          builder: (context, stateV2) {
                            return Opacity(
                              // opacity: 1,
                              opacity:
                                  state.size > 0.99 && stateV2.size > 0 ? 0 : 1,
                              child: Transform.scale(
                                scale: 1 + ((state.size - 0.15) * 6.5),
                                alignment: Alignment.bottomLeft,
                                origin: Offset(-8, -60),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  color: Colors.grey,
                                  child: Center(
                                    child: Icon(Icons.music_note),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 15,
                    child: BlocBuilder<BottomSheetCubit, BSData>(
                      builder: (context, state) {
                        return Opacity(
                          opacity: state.size > 0.99 ? 1 : 0,
                          child: BlocBuilder<BottomSheetCubitV2, BSDataV2>(
                            builder: (context, stateV2) {
                              final vv = ((stateV2.size - 0.1) / (0.9 - 0.1)) *
                                      (6.5 - 0.4) +
                                  0.4;
                              log('[vv] $vv');
                              return Transform.scale(
                                // scale: 1 * (0.7 / stateV2.size),

                                scale: 1 + ((1 - stateV2.size) * (6.5 - vv)),
                                // scale: 1 + ((1 - stateV2.size) * 6.5),
                                alignment: Alignment.bottomLeft,
                                // origin: Offset(-10, -65),
                                // origin: Offset(13.5, -25),
                                origin: Offset(-7.5, -57),
                                // origin: Offset(-7.5, -57),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  color: Colors.grey,
                                  child: Center(
                                    child: Icon(Icons.music_note),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  DraggableScrollableSheet(
                    initialChildSize: 0.1,
                    maxChildSize: 0.90,
                    minChildSize: 0.1,
                    expand: true,
                    snap: true,
                    controller: upNextController,
                    builder: (context, scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Color.fromRGBO(30, 30, 30, 1),
                          ),
                          // color: Colors.amber,
                          margin: EdgeInsets.only(top: 16),
                          // height: 706,
                          height: MediaQuery.of(context).size.height * 0.88,
                          // height: MediaQuery.of(context).size.height * .80,
                          child: Column(
                            children: [
                              strip(),
                              YTComponent.secondBottomSheetHeader(),
                              SingleChildScrollView(
                                controller: scrollController,
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.80,
                                      color: Color.fromRGBO(30, 30, 30, 1),
                                      child: YTComponent.trackListWidget(),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container strip() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      height: 4,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.grey,
      ),
    );
  }

  SliverAppBar secondaryAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      title: Container(
        decoration: tagDecoration,
        padding: EdgeInsets.symmetric(vertical: 10),
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: YTComponent.tagListWidget(),
      ),
    );
  }

  BlocBuilder<BottomSheetCubit, BSData> bottomNavBar() {
    return BlocBuilder<BottomSheetCubit, BSData>(
      builder: (context, state) {
        // print('[ui] $state');
        return Container(
          color: Color.fromRGBO(33, 33, 33, 1),
          height: state.bsHeight > 0 ? state.bsHeight : 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.explore,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.library_music,
                  color: Colors.white,
                ),
                onPressed: () {},
              )
            ],
          ),
        );
      },
    );
  }

  void onTapSraggableSheet() {
    print('[ontap]');
    draggableScrollableController.animateTo(
      1,
      duration: Duration(milliseconds: 400),
      curve: Curves.decelerate,
    );
  }

  Widget currentMusicWidget(double opacity) {
    return BlocBuilder<BottomSheetCubitV2, BSDataV2>(
      builder: (context, stateV2) {
        return BlocBuilder<BottomSheetCubit, BSData>(
          builder: (context, state) {
            // print(
            //     '[BlocBuilder] opa ${state.opacity.toStringAsPrecision(3)} | size ${state.size.toStringAsPrecision(3)} | heig ${state.bsHeight.toStringAsPrecision(3)}');
            final playbackOpacity =
                (1 - (state.size - 0.145) / (0.350 - 0.145));
            final playbackOpacityV2 = ((stateV2.size - 0.35) / (0.9 - 0.35));
            final castOpacity = ((state.size - 0.65) / (1 - 0.65));
            final castOpacityV2 = (1 - (stateV2.size - 0.1) / (0.350 - 0.1));
            return Stack(
              children: [
                Visibility(
                  visible: true,
                  // visible: !((state / 54) < 0.02),
                  child: Opacity(
                    opacity: stateV2.size > 0.35
                        ? (playbackOpacityV2 > 1 ? 1 : playbackOpacityV2)
                        : playbackOpacity < 0
                            ? 0
                            : playbackOpacity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Opacity(
                                    opacity: 0,
                                    child: Container(
                                      color: Colors.black,
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Song Name Goes Here',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        'Song Description',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      bottomSheetCubit = BottomSheetCubit();

                                      print(
                                          '[onPressed] ${bottomSheetCubit.state}');
                                    },
                                    icon: Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        LinearProgressIndicator(
                          value: 25,
                          backgroundColor: Colors.white,
                          color: Color.fromRGBO(78, 78, 78, 1),
                        )
                      ],
                    ),
                  ),
                ),
                Opacity(
                  opacity: stateV2.size > 0.1
                      ? (castOpacityV2 < 0 ? 0 : castOpacityV2)
                      : castOpacity < 0
                          ? 0
                          : castOpacity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                        color: Colors.white,
                      ),
                      Container(
                        width: 190,
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        margin: EdgeInsets.only(top: 8),
                        child: YTComponent.songVideoStackWidget(),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => {},
                            icon: Icon(Icons.cast),
                            color: Colors.white,
                          ),
                          IconButton(
                            onPressed: () => {},
                            icon: Icon(Icons.more_vert),
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}
