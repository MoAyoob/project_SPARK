import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bill_management_screen.dart';
import 'rewards_screen.dart';
import 'usage_analysis_screen.dart';
// Import if you have this screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static final List<Device> _devices = [
    Device(
      name: "Smart TV",
      room: "Haidar room",
      status: false,
      icon: 'tv.svg',
    ),
    Device(
      name: "Air Purifier",
      room: "Kitchen",
      status: true,
      icon: 'air-purifier.svg',
    ),
    Device(
      name: "Air Conditioner",
      room: "Hussain's Room",
      status: false,
      icon: 'air-conditioner.svg',
    ),
    Device(
      name: "Main Router",
      room: "Huawei Router 5G",
      status: true,
      icon: 'router.svg',
    ),
    Device(
      name: "Smart Light",
      room: "Hall - 4 lights",
      status: false,
      icon: 'light-bulb.svg',
    ),
    Device(name: "Socket", room: "Kitchen", status: false, icon: 'plug.svg'),
  ];

  static final List<Widget> _widgetOptions = <Widget>[
    _buildHomeContent(),
    const UsageAnalysisScreen(),
    const BillManagementScreen(),
    const RewardsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'My Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Bill',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Rewards'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  static Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Mohammed's Home",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {
                    // Navigate to UserProfileScreen
                    // You can add your navigation code here
                    // Example:
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const UserProfileScreen()),
                    // );
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Current bill",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "17.03 BHD",
                    style: TextStyle(
                      color: Colors.green[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildControlButton(
                  icon: "control.svg",
                  label: "Control & Secure",
                  onPressed: () {},
                ),
                _buildControlButton(
                  icon: "add.svg",
                  label: "Add Devices",
                  onPressed: () {},
                ),
                _buildControlButton(
                  icon: "solar.svg",
                  label: "Solar Panel",
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              "My IoT Devices",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio:
                    2.0, // Changed: Extreme reduction in aspect ratio
              ),
              itemCount: _devices.length,
              itemBuilder: (context, index) {
                return _buildDeviceItem(
                  device: _devices[index],
                  context: context,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildControlButton({
    required String icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    String iconPath = "assets/icons/$icon";
    try {
      if (icon == "control.svg") {
        return Column(
          children: [
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[100],
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: SvgPicture.asset(
                iconPath,
                width: 30,
                height: 30,
                colorFilter: const ColorFilter.mode(
                  Colors.green,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ],
        );
      } else if (icon == "add.svg" || icon == "solar.svg") {
        return Column(
          children: [
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[100],
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: SvgPicture.asset(
                iconPath,
                width: 30,
                height: 30,
                colorFilter: const ColorFilter.mode(
                  Colors.green,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[100],
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Icon(
                Icons.question_mark,
                size: 30,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ],
        );
      }
    } catch (e) {
      return Column(
        children: [
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[100],
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Icon(
              Icons.question_mark,
              size: 30,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      );
    }
  }

  static Widget _buildDeviceItem({
    required Device device,
    required BuildContext context,
  }) {
    String iconPath = "assets/icons/${device.icon}";
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Card(
          color: Colors.green[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              4,
            ), // Changed: Reduced padding even further
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child:
                        device.icon.endsWith('.svg')
                            ? SvgPicture.asset(
                              iconPath,
                              width: 40,
                              height: 40,
                              colorFilter: const ColorFilter.mode(
                                Colors.green,
                                BlendMode.srcIn,
                              ),
                            ) // Changed: Increased icon size significantly
                            : (device.icon.endsWith('.png') ||
                                    device.icon.endsWith('.jpg')
                                ? Image.asset(
                                  iconPath,
                                  width: 40,
                                  height: 40,
                                ) // Changed: Increased icon size significantly
                                : const Icon(
                                  Icons.question_mark,
                                  size: 40,
                                  color: Colors.green,
                                )), // Changed: Increased icon size significantly
                  ),
                ),
                const SizedBox(height: 1), // Changed: Reduced space
                Text(
                  device.name,
                  style: const TextStyle(
                    fontSize: 12, // Changed: Increased font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  device.room,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ), // Changed: Increased font size
                ),
                const SizedBox(height: 1), // Changed: Reduced space
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      device.status ? "On" : "Off",
                      style: const TextStyle(fontSize: 10),
                    ), // Changed: Increased font size
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: device.status,
                        onChanged: (value) {
                          setState(() {
                            device.status = value;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.grey,
                      size: 10,
                    ),
                    onPressed: () {
                      _showDeviceControlPopup(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void _showDeviceControlPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(content: DeviceControlScreen());
      },
    );
  }
}

class Device {
  String name;
  String room;
  bool status;
  String icon;

  Device({
    required this.name,
    required this.room,
    required this.status,
    required this.icon,
  });
}

class DeviceControlScreen extends StatefulWidget {
  const DeviceControlScreen({Key? key}) : super(key: key);

  @override
  State<DeviceControlScreen> createState() => _DeviceControlScreenState();
}

class _DeviceControlScreenState extends State<DeviceControlScreen> {
  final List<String> devices = [
    "Living Room Light",
    "Kitchen Light",
    "Bedroom Light",
    "Water Valve",
  ];
  final Map<String, bool> _deviceStates = {};
  @override
  void initState() {
    super.initState();
    for (var device in devices) {
      _deviceStates[device] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          double.maxFinite, // Ensure the card takes up the full width available
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Use minimum space needed
          children: [
            ...devices.map((device) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListTile(
                  title: Text(device),
                  trailing: Switch(
                    value: _deviceStates[device] ?? false,
                    onChanged: (bool value) {
                      setState(() {
                        _deviceStates[device] = value;
                      });
                      print("Device '$device' toggled to: $value");
                    },
                    activeColor: Theme.of(context).primaryColor,
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
