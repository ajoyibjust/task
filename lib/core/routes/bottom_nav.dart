import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task/features/presentation/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:task/features/presentation/blocs/favorite_bloc/favorite_state.dart';

class BottomNav extends StatefulWidget {
  final Widget child;
  const BottomNav({super.key, required this.child});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _index(String location) {
    if (location.startsWith("/favorites")) return 1;
    return 0;
  }

  int count = 0;
  double scale = 1;

  _animation() async {
    setState(() {
      scale = 1.5;
    });
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      scale = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final index = _index(location);
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BlocListener<FavoriteBloc, FavoriteState>(
        listener: (context, state) {
          if (state is FavoriteLoaded) {
            setState(() {
              count = state.favorite.length;
            });
            _animation();
          }
        },
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: index,
          onTap: (idx) {
            switch (idx) {
              case 0:
                context.go('/');
                break;
              case 1:
                context.go("/favorites");
                break;
            }
          },

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
            BottomNavigationBarItem(
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(Icons.favorite),
                  Positioned(
                    top: -5,
                    right: -7,
                    child: AnimatedScale(
                      duration: Duration(milliseconds: 150),
                      scale: scale,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            count.toString(),
                            style: TextStyle(fontSize: 11, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
