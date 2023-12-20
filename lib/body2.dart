import 'package:flutter/material.dart';
import 'package:uiexperimentchenn/body3.dart';
import 'package:uiexperimentchenn/main.dart';
import 'package:uiexperimentchenn/themedata.dart';

class Body2 extends StatefulWidget {
  const Body2({super.key});

  @override
  State<Body2> createState() => _Body2State();
}

class _Body2State extends State<Body2> {
  // Define the selected and unselected tab label styles
  final TextStyle selectedLabelStyle = const TextStyle(
    color: Colors.blue, // Selected tab text color
    fontWeight: FontWeight.bold,
  );
  final TextStyle unselectedLabelStyle = const TextStyle(
      color: Colors.black, fontSize: 15 // Unselected tab text color
      );

  // Define the tab indicator size and color
  final BoxDecoration tabIndicator = BoxDecoration(
    color: Colors.blueAccent, // Indicator (background) color for selected tab
    borderRadius: BorderRadius.circular(20.0),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Project',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 39,
                        decoration: const BoxDecoration(),
                        child: TabBar(
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          unselectedLabelStyle: unselectedLabelStyle,
                          labelStyle: selectedLabelStyle,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                25.0), // Border radius of the indicator
                            color: kblue, // Indicator color
                          ),
                          indicatorColor: Colors
                              .transparent, // Set the default indicatorColor to transparent
                          tabs: const [
                            Tab(text: 'All'),
                            Tab(text: 'Ongoing'),
                            Tab(text: 'Completed'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              const Column(
                children: [
                  ListItemWidget(
                    color: Colors.green,
                    name: 'Dashboard Design',
                  ),
                  SizedBox(height: 6),
                  ListItemWidget(
                    color: Colors
                        .blue, // Replaced 'kblue' with Colors.blue for example
                    name: 'UI/UX Design',
                  ),
                  SizedBox(height: 6),
                  ListItemWidget(
                    color: Colors.red,
                    name: 'App Animation Design',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final Color color;
  final String name;

  const ListItemWidget({super.key, required this.color, required this.name});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => const Body3()));
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 1,
          //     blurRadius: 18,
          //     offset: const Offset(0, 3),
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Today, Shared by - UI Been',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Team',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Stackedpeaople2(),
                  ],
                ),
                ProgressWidget(color: color)
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0),
              child: Text(
                'July 25, 2021 - July 30, 2021',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Stackedpeaople2 extends StatelessWidget {
  const Stackedpeaople2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Team avatars + Add button

          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 50, maxWidth: 100),
            child: const Stack(
              children: <Widget>[
                Positioned(
                  left: 0.0,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/avaters/Avatar 3.jpg'),
                    radius: 16,
                  ),
                ),
                Positioned(
                  left: 16.0, // adjust the value to change the overlap
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/avaters/Avatar 6.jpg'),
                    radius: 16,
                  ),
                ),
                Positioned(
                  left: 32.0, // adjust the value to change the overlap
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/avaters/Avatar 1.jpg'),
                    radius: 16,
                  ),
                ),
                Positioned(
                  left: 48.0, // adjust the value to change the overlap
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.add, color: Colors.white),
                    radius: 16,
                  ),
                ),
              ],
            ),
          ),

          // Progress indicator
        ]);
  }
}

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    super.key,
    required this.color,
    this.radius = 80,
  });

  final Color color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: radius,
          width: radius,
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  '85%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: radius,
                width: radius,
                child: CircularProgressIndicator(
                  value: 0.85,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  backgroundColor: Colors.grey[100],
                  strokeWidth: 8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
