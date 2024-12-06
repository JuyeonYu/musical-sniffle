import 'package:flutter/material.dart';
import 'package:mike_list/main_screen.dart';

class OnboardingparentView extends StatefulWidget {

    
  int _currentPage = 0; // Track current page index
    

  OnboardingparentView ({super.key});

  @override
  State<OnboardingparentView> createState() => _OnboardingparentViewState();
}

class _OnboardingparentViewState extends State<OnboardingparentView> {
  final PageController _pageController = PageController();
  List<Widget> _pages = const [
    _OnboardChildView(title: 'title1', body: 'body1', image: 'assets/image1.png'),
    _OnboardChildView(title: 'title2', body: 'body2', image: 'assets/image2.png'),
    _OnboardChildView(title: 'title3', body: 'body3', image: 'assets/image3.png'),
  ];

  int _currentPage = 0;
  
  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(children: [
        Expanded(
          child: Container(color: Colors.blue, child: PageView(controller: _pageController, onPageChanged: _onPageChanged, children: _pages,) ,),
        ),
      ElevatedButton(onPressed: () {
        if (_currentPage < _pages.length - 1) {
          _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
        } else {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MainScreen()), (Route<dynamic> route) => false);
        }
        
      }, child:  Text(_currentPage < _pages.length - 1 ? 'go' : 'done'))
      ],),
    );
  }
}

class _OnboardChildView extends StatelessWidget {
  final String title;
  final String body;
  final String image;

  const _OnboardChildView({
    required this.title,
    required this.body,
    required this.image,
  });  
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        // 타이틀을 표시
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        // 본문 내용
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            body,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
    }
}