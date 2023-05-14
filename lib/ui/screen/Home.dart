import 'dart:math';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:todo_app/models/common/common_model.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/provider/todo_provider.dart';

import '../../constants/constant.dart';
import '../../data/database.dart';
import '../../utils/common_func.dart';
import '../widget/ButtonStatus.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int pageNum = 10;
  String nowStatus = 'TODO';
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  TodoDataBase db = TodoDataBase();
  void callLoadData() {
    ref.read(todoProvider.notifier).loadData(0, pageNum, true, "TODO");
  }

  void _onRefresh() {
    callLoadData();
    refreshController.refreshCompleted();
  }

  void _onLoading() {
    pageNum += 10;
    
    if (mounted) setState(() {});

    callLoadData();
    refreshController.loadComplete();
  }

  @override
  void initState() {
    db.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List> todoItem = ref.watch(todoProvider).todoModel;
    bool isLoading = ref.watch(todoProvider).isLoading;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      child: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.grey))
          : Column(
              children: [
                SizedBox(
                  height: height * 0.3 + 30,
                  child: Stack(alignment: Alignment.topCenter, children: [
                    Container(
                      width: width,
                      height: height * 0.3,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                      decoration: boxBottomBorderDec,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hi! ${db.username}',
                            style: styleName,
                          ),
                          Text(
                            'Welcome to Todo App ',
                            style: styleWelcomeText,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                        child: Container(
                          width: width * 0.8,
                          height: 60,
                          decoration: boxStatusDec,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: statusList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                String status = statusList[index];
                                return ButtonStatus(
                                  nowTypePick: nowStatus,
                                  onpress: () {
                                    setState(() {
                                      nowStatus = status;
                                      ref.read(todoProvider.notifier).loadData(
                                          0, pageNum, true, nowStatus);
                                    });
                                  },
                                  type: status,
                                );
                              }),
                        ),
                      ),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: true,
                    controller: refreshController,
                    header: WaterDropMaterialHeader(
                      color: Colors.black,
                      backgroundColor: Colors.grey.shade300,
                    ),
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              String key = todoItem.keys.elementAt(index);
                              List? values = todoItem[key];
                              bool isEmpty = values!.isEmpty;
                              return isEmpty
                                  ? const SizedBox()
                                  : Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.1),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            formatDate(key),
                                            style: styleFormatDate,
                                          ),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: values.length,
                                            itemBuilder: (context, index) {
                                              Todo item = values[index];
                                              return _Listtile(
                                                  context, item, key);
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                            },
                            childCount: todoItem.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
    ));
  }

  Widget _Listtile(BuildContext context, Todo item, String key) {
    TodoDataBase db = TodoDataBase();
    Map<String, List> todoItem = ref.watch(todoProvider).todoModel;
    final width = MediaQuery.of(context).size.width;
    return Dismissible(
      key: Key(item.id),
      background: Container(color: Colors.grey),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          db.updateDeleteItem(item.id);
          todoItem[key]!.removeWhere((element) => element.id == item.id);
        });
      },
      child: Container(
        width: width * 0.8,
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(12),
        decoration: styleBoxListtile,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: styleFormatDate,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              item.description,
              style: styleDescription,
            ),
          ],
        ),
      ),
    );
  }
}
