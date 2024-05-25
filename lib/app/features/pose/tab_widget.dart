import 'package:impossible_flutter/app/core/core.dart';

class IMTabView extends StatefulWidget {
  const IMTabView({
    super.key,
    required this.tabList,
    required this.widgetList,
    required this.length,
  })  : assert(tabList.length != 0 || widgetList.length != 0,
            'tablist와 widgetlist의 갯수 모두 0보다 커야 합니다'),
        assert(
          tabList.length == widgetList.length,
          'tablist와 widgetlist의 갯수는 같아야 합니다',
        );

  final List<String> tabList;
  final List<Widget> widgetList;
  final int length;

  @override
  State<IMTabView> createState() => _IMTabViewState();
}

class _IMTabViewState extends State<IMTabView> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: widget.length,
      vsync: this, // vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle labelStyle = TextStyle(
      fontSize: 20,
      fontFamily: 'PretendardBold',
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Changed to stretch
          children: [
            SizedBox(
              width: double.infinity, // Ensure the TabBar takes up full width
              child: TabBar(
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3,
                    color: IMColors.blue1200,
                  ),
                  insets: EdgeInsets.symmetric(
                      horizontal: 16), // Added insets for better visibility
                ),
                tabs: widget.tabList
                    .map((e) => Container(
                          height: 70,
                          alignment: Alignment.center,
                          child: Text(e),
                        ))
                    .toList(),
                isScrollable:
                    false, // Set to false to make tabs take equal space
                labelPadding: EdgeInsets.zero, // Removed label padding
                labelStyle: labelStyle,
                labelColor: IMColors.blue1200,
                unselectedLabelColor: IMColors.blue600.withOpacity(0.7),
                controller: _tabController,

                // for no splash
                splashFactory: NoSplash.splashFactory,
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  return states.contains(MaterialState.focused)
                      ? null
                      : Colors.transparent;
                }),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: widget.widgetList.map((e) => e).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
