import 'package:flutter/material.dart';
import 'package:uiexperimentchenn/body2.dart';
import 'package:fl_chart/fl_chart.dart';

class Body3 extends StatelessWidget {
  const Body3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            // Handle back button press
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onPressed: () {
              // Handle more button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dashboard design",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Text(
                          "Today, Shared by - Unbox Digital",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 33,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.all(22.0),
                            child: ProgressWidget(
                              color: Colors.green,
                              radius: 90,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Deadline',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
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
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const Row(
                    children: [
                      Text(
                        "Project Progress",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )
                    ],
                  ),
                  ProjectTickBox(),
                  const Chartt(),
                  const SizedBox(
                    height: 40,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectTickBox extends StatefulWidget {
  ProjectTickBox({super.key});

  @override
  _ProjectTickBoxState createState() => _ProjectTickBoxState();
}

class _ProjectTickBoxState extends State<ProjectTickBox> {
  bool _isChecked1 = true;
  bool _isChecked2 = true;
  bool _isChecked3 = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      padding: const EdgeInsets.all(16),
      child: const Column(
        children: [
          MyCustomCheckboxListTile(
            name: 'Create wireframe',
          ),
          MyCustomCheckboxListTile(
            name: 'Create user flow',
          ),
          MyCustomCheckboxListTile(name: "Transform to visual design")
        ],
      ),
    );
  }
}

class MyCustomCheckboxListTile extends StatefulWidget {
  final String name;

  const MyCustomCheckboxListTile({super.key, required this.name});
  @override
  _MyCustomCheckboxListTileState createState() =>
      _MyCustomCheckboxListTileState();
}

class _MyCustomCheckboxListTileState extends State<MyCustomCheckboxListTile> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.name,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      leading: Transform.scale(
        scale: 1.1,
        child: Theme(
          data: ThemeData(unselectedWidgetColor: const Color(0xFFBDBDBD)),
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            activeColor: Theme.of(context).primaryColor,
            checkColor: Colors.white,
            value: _isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                _isChecked = newValue!;
              });
            },
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
    );
  }
}

class Chartt extends StatelessWidget {
  const Chartt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Project Overview',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Container(
              height: 33,
              decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(
                //     color: Color(
                //         0xFFCCCCCC)), // Example border color, adjust as needed
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    elevation: 0,
                    value: 'Weekly',
                    icon: const Icon(Icons.arrow_drop_down,
                        color: Color(
                            0xFF757575)), // Example icon color, adjust as needed
                    style: const TextStyle(
                        color: Color.fromARGB(255, 155, 152, 152),
                        fontSize: 12), // Example text style, adjust as needed
                    onChanged: (String? newValue) {
                      // Handle dropdown changes
                    },
                    items: <String>['Weekly', 'Monthly', 'Yearly']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 4),
        const SizedBox(height: 16),
        Container(
          height: 200,
          child: LineChart(
            LineChartData(
              minX: 0, // Starting point of the X axis
              maxX: 5, // Ending point of the X axis, assuming 6 days a week
              minY: 0, // Starting point of the Y axis
              maxY: 8, // Ending point of the Y axis, adjust as per your data
              gridData: const FlGridData(show: false), // No grid data
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 20, // Adjust the size for titles
                    getTitlesWidget: (double value, TitleMeta meta) {
                      const style = TextStyle(
                        color: Color(0xff68737d),
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      );
                      Widget text;
                      switch (value.toInt()) {
                        case 0:
                          text = const Text('Sun', style: style);
                          break;
                        case 1:
                          text = const Text('Mon', style: style);
                          break;
                        case 2:
                          text = const Text('Tue', style: style);
                          break;
                        case 3:
                          text = const Text('Wed', style: style);
                          break;
                        case 4:
                          text = const Text('Thu', style: style);
                          break;
                        case 5:
                          text = const Text('Fri', style: style);
                          break;
                        default:
                          text = const Text('');
                      }
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 8.0,
                        child: text,
                      );
                    },
                  ),
                ),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: true),
                ),
              ),
              borderData: FlBorderData(show: false), // No border
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    const FlSpot(0, 3),
                    const FlSpot(1, 4),
                    const FlSpot(2, 2),
                    const FlSpot(3, 5),
                    const FlSpot(4, 3),
                    const FlSpot(5, 6),
                  ],
                  isCurved: true,
                  color: const Color.fromARGB(255, 149, 230,
                      120), // Adjust the color to match your image
                  barWidth: 5, // Adjust the width to match your image
                  dotData: const FlDotData(show: false), // Hide or style dots
                  belowBarData: BarAreaData(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 113, 244, 121)
                            .withOpacity(0.5),
                        const Color.fromARGB(255, 115, 243, 72)
                            .withOpacity(0.0),
                      ],
                    ),
                    show: true,
                    // Adjust gradient to match your image
                    // gradientFrom: const Offset(0.5, 0), // Adjust gradient positioning
                    // gradientTo: const Offset(0.5, 1), // Adjust gradient positioning
                  ),
                ),
              ],
              // Additional settings for the background color and other styles
              backgroundColor:
                  Colors.white, // Set the background color if necessary
            ),
          ),
        ),
      ],
    );
  }
}
