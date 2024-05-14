import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _iconHeight = 23.0;
const TextStyle _labelStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 11,
);

const _selectedClr = Color(0x00000000);
const _unselectedClr = Colors.white;

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
        height: 80 + MediaQuery.of(context).padding.bottom / 3,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedFontSize: 12,
          onTap: (index) {
            onChanged(index);
          },
          backgroundColor: const Color(0xff1e1e1e),
          currentIndex: selectedIdx,
          // backgroundColor: GZColor.bgColor,
          // unselectedItemColor: GZColor.black,
          // selectedItemColor: GZColor.black,
          unselectedLabelStyle: _labelStyle,
          selectedLabelStyle: _labelStyle,
          items: [
            const BottomNavigationBarItem(
              tooltip: '',
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: SizedBox(
                  height: _iconHeight,
                  child: Icon(
                    Icons.home,
                    color: _selectedClr,
                  ),
                ),
              ),
              icon: Padding(
                padding: EdgeInsets.only(bottom: 5),
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
                padding: const EdgeInsets.only(bottom: 5),
                child: SizedBox(
                    height: _iconHeight,
                    child: SvgPicture.asset(
                      _getImgPath('logo_only.svg'),
                      fit: BoxFit.fitHeight,
                    )),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SizedBox(
                    height: _iconHeight,
                    child: SvgPicture.asset(
                      _getImgPath('logo_only.svg'),
                      fit: BoxFit.fitHeight,
                    )),
              ),
              label: 'MAKE',
              backgroundColor: Colors.white,
            ),
            const BottomNavigationBarItem(
              tooltip: '',
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: SizedBox(
                  height: _iconHeight,
                  child: Icon(
                    Icons.person,
                    color: _selectedClr,
                  ),
                ),
              ),
              icon: Padding(
                padding: EdgeInsets.only(bottom: 5),
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
