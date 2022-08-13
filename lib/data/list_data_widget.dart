import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';

import 'list_data_model.dart';

typedef ListDataWidgetBuilder = Widget Function<T extends ListDataModel>(BuildContext context, int index);

class ListDataWidget<T extends ListDataModel> extends StatefulWidget {
  final ListDataWidgetBuilder builder;
  final bool refreshEnable;
  final bool loadMoreEnable;
  final bool reverse;
  final bool autoInit;
  final String emptyTips;
  final Header? header;
  final Footer? footer;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final bool emptyEnable;
  final Widget? emptyWidget;
  final List<Widget> slivers;

  ///如果提供了其它slivers，那么可以指定primaryList的位置，默认插入到最前边
  ///如果没提供其它slivers，就用默认的
  final int primaryListIndex;

  ListDataWidget({
    Key? key,
    required this.builder,
    this.refreshEnable = true,
    this.loadMoreEnable = true,
    this.header,
    this.footer,
    this.reverse = false,
    this.autoInit = true,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
    this.emptyEnable = true,
    this.emptyWidget,
    this.emptyTips = '暂无数据',
    this.slivers = const [],
    this.primaryListIndex = 0,
  }) : super(key: key) {
    assert(primaryListIndex >= 0 && primaryListIndex <= (slivers.length));
  }

  @override
  _ListDataWidgetState createState() => _ListDataWidgetState<T>();
}

class _ListDataWidgetState<T extends ListDataModel> extends State<ListDataWidget> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    if (widget.autoInit) {
      Provider.of<T>(context, listen: false).init();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var emptyWidget = widget.emptyWidget;
    emptyWidget ??= Text(widget.emptyTips);
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (ScrollUpdateNotification notification) {
        final FocusScopeNode focusScope = FocusScope.of(context);
        if (notification.dragDetails != null && focusScope.hasFocus) {
          focusScope.unfocus();
        }
        return false;
      },
      child: Scrollbar(
        child: EasyRefresh.custom(
          header: widget.header ?? MaterialHeader(),
          footer: widget.footer ?? MaterialFooter(),
          reverse: widget.reverse,
          controller: Provider.of<T>(context).controller,
          slivers: slivers(context),
          emptyWidget: widget.emptyEnable ? (Provider.of<T>(context).isEmpty ? emptyWidget : null) : null,
          onRefresh: widget.refreshEnable ? () => Provider.of<T>(context, listen: false).refresh() : null,
          onLoad: widget.loadMoreEnable ? () => Provider.of<T>(context, listen: false).loadMore() : null,
          scrollDirection: widget.scrollDirection,
          shrinkWrap: widget.shrinkWrap,
        ),
      ),
    );
  }

  List<Widget> slivers(BuildContext context) {
    List<Widget> slivers = [];
    slivers.addAll(widget.slivers);
    slivers.insert(widget.primaryListIndex, primaryList(context));
    return slivers;
  }

  Widget primaryList(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => widget.builder<T>(context, index),
        childCount: Provider.of<T>(context).itemCount,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
