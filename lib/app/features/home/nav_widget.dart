import 'package:impossible_flutter/app/core/core.dart';

const _iconHeight = 20.0;
const TextStyle _labelStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 12,
);

const _selectedClr = IMColors.blue900;
const _unselectedClr = IMColors.blue400;

class NavWidget extends StatelessWidget {
  const NavWidget({
    Key? key,
    required this.selectedIdx,
    required this.onChanged,
  }) : super(key: key);

  final int selectedIdx;
  final Function(int) onChanged;

  _getImgPath(String name) => 'assets/images/$name';

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: SizedBox(
        height: 75 + MediaQuery.of(context).padding.bottom / 3,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedFontSize: 12,
          onTap: (index) {
            onChanged(index);
          },
          backgroundColor: IMColors.beige100,
          currentIndex: selectedIdx,
          unselectedLabelStyle: _labelStyle,
          selectedLabelStyle: _labelStyle,
          items: [
            const BottomNavigationBarItem(
              tooltip: '',
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 1),
                child: SizedBox(
                  height: _iconHeight,
                  child: Icon(
                    Icons.home,
                    color: _selectedClr,
                  ),
                ),
              ),
              icon: Padding(
                padding: EdgeInsets.only(bottom: 1),
                child: SizedBox(
                  height: _iconHeight,
                  child: Icon(
                    Icons.home,
                    color: _unselectedClr,
                  ),
                ),
              ),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              tooltip: '',
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Image.asset(
                  _getImgPath("plusicon_clicked.png"),
                  height: 22,
                ),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Image.asset(
                  _getImgPath("plusicon3.png"),
                  height: 22,
                ),
              ),
              label: 'MAKE',
              backgroundColor: Colors.white,
            ),
            const BottomNavigationBarItem(
              tooltip: '',
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 1),
                child: SizedBox(
                  height: _iconHeight,
                  child: Icon(
                    Icons.person,
                    color: _selectedClr,
                  ),
                ),
              ),
              icon: Padding(
                padding: EdgeInsets.only(bottom: 1),
                child: SizedBox(
                  height: _iconHeight,
                  child: Icon(
                    Icons.person,
                    color: _unselectedClr,
                  ),
                ),
              ),
              label: 'Dashboard',
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
