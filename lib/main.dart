import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Programming Culminating'),
      initialRoute:
          '/', // Different routes accessed through navigator and created with classes
      routes: {
        '/code-explanation-documentation': (context) => ceDocPage(),
        '/code-explanation-variables': (context) => ceVarPage(),
        '/code-explanation-if-statements': (context) => ceIfPage(),
        '/code-explanation-loops': (context) => ceLoopsPage(),
        '/code-explanation-functions': (context) => ceFunctionsPage(),
      },
      title: 'Programming Culminating by Anish',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final _tabController =
      TabController(length: 3, vsync: this); // Important for switching tabs

  final Map<String, String> _information = {
    'Documentation | Purpose':
        'Documentation is to improve code readability, understanding, and address the creator of the program, when they made and last edited the program.',
    'Documentation | How it works':
        'The header is in a specific format, following the order of name, purpose, author, created and updated. Variable naming makes sense and fits into the code well. Comments are made in specific amounts to explain the code around it so that another programmer can understand it and edit it easier without having to spend time thoroughly reading through the program. Variables are also named clearly, according to either pothole case or camelcase and make sense towards the overall program. ',
    'Documentation | How is it used':
        'This boolean is used to determine whether a while loop continues or stops. It is altered later in the code depending on inputs from the user asking it to stop.',
    'Documentation | Missing':
        'Occasionally, I do not make my variables detailed enough. Sometimes I used single letters for variables which do not tell people their purpose.',
    'Variables | Purpose':
        'Variable with a value acting as a placeholder. Determines the maximum amount in the binary conversion.',
    'Variables | How is it used':
        'The max_Amount variable takes 2 and uses the power of the amount of binary digits to determine the maximum amount the binary can be. This works because binary is a base 2 system. The code is then made to divide the max_Amount variable by 2, and add it depending on its digit (0 or 1). This variable is only used and changed during the num_to_bin() function where the binary and decimal values are converted interchangeably. It is not required outside of the function.',
    'Variables | How it works':
        'In Python, a variable is assigned a name followed by an equal sign and then a value. These values are generally integers, strings and booleans.',
    'Variables | Missing':
        'In Example 1 and 2, the naming of the variable is incorrect as they do not use either pothole case or camel case, instead combining them. ',
    'If Statements | Purpose':
        'If statements are conditionals to allow for different actions to occur depending on the situation.',
    'If Statements | How it works':
        'This code uses if statements and changes to variables. The multiple if statements that are nested within the if statement allow for different variable values to create different outcomes.',
    'If Statements | How it is used':
        'This code first checks whether the accuracy passes the random check (meaning they hit their target). It then checks if it is a basic attack (skillAttacker == 0), skill or if they do not have enough SP for an attack. If they do not pass the accuracy test, they miss.',
    'Loops | Purpose':
        'Loops are used to run a certain section of code multiple times, sometimes with differing values by altering variables.',
    'Loops | How it works':
        'In Python, there are 2 standard loops, the while loop and for loop. The while loop takes a condition and continues the code indented beneath it until the condition is proven false (Example 1). The for loop takes a variable and a range, repeating the code within it depending on its range. This variable can then be used within the loop to change values depending on what the programmer wants (Example 2). Another way a for loop can be used is to take the values contained in e.g. a list and iterate (go through the values) through that list, using it with the code contained within (Example 3).',
    'Loops | How it is used':
        'Example 1 works by looping until a condition is proven false. Example 2 is more complicated, using two for loops to loop through multiple lists and list values using an if statement to check and assign values. Example 3 works by going through two lists and assigning them increasing values as the loop progresses. For example, an upper_case ‘A’ would first create a key with the same letter and then create the binary value based on the amount of times the loop has run. ',
    'Functions | Purpose':
        'The purpose of a function is to repeat a certain piece of code, sometimes with different values. These different values are called parameters and will change the returned value. ',
    'Functions | How it works':
        'In Python, a function is first defined, with its name and parameters. The name is what will be called and its parameters will have values inputted within a set of brackets when it is called. A function is recommended to be located at the beginning of the program, not access variables outside of itself/its parameters and return its results. Within a function, a programmer can access the parameters by calling their variable names, however when used, the parameters that are inputted with the function will replace these variable names leading to different results.',
    'Functions | How it is used':
        'In Example 3, the function is called with many parameters being accessed through lists and dictionaries. These list and dictionary values are related to the necessary parameters, which is shown in Example 1. Finally, the parameters are used throughout the function, Example 2 showing one of the cases.',
  };

  @override
  Widget build(BuildContext context) {
    List<String> tabs = [];

    var infoEntries = _information.entries.toList();

    for (var i = 0; i < infoEntries.length; i++) {
      tabs.add(infoEntries[i].key);
    }

    _buttonCode(name, route) {
      return Row(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '$route');
            },
            child: Center(
              child: Card(
                color: Colors.grey,
                shadowColor: Colors.purple,
                elevation: 20,
                child: Container(
                  height: 200,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 0.6,
                        image: AssetImage("images/pingu.jpeg")),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "$name",
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 30,
                          color: Colors.white,
                          backgroundColor: Color.fromARGB(137, 158, 158, 158),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    Map<String, String> questionAnswer = {
      "What is the purpose of documentation?":
          "Documentation is to improve code readability, understanding, and address the creator of the program, when they made and last edited the program. ",
      "What is the format of a header?":
          "Name, Purpose, Author, Created Date and Updated Date.",
      "What does a good variable name have?":
          "A good variable name makes sense and fits into the code well, allowing other programmers to understand it at sight without having to ask the original programmer. Variables are also named clearly, according to either pothole case or camelcase and make sense towards the overall program.",
      "What do comments do?":
          "Comments are made in specific amounts to explain the code around it so that another programmer can understand it and edit it easier without having to spend time thoroughly reading through the program.",
      "What is the purpose of a variable?":
          "Variables are a way to store values within a code, including strings, integers and booleans.",
      "How are variables created?":
          "In Python, a variable is assigned a name followed by an equal sign and then a value. These values are generally integers, strings and booleans.",
      "What are the 2 general forms of variable naming in Python?":
          "Pothole case and Camelcase. ",
      "What is the purpose of an if statement?":
          "If statements are conditionals to allow for different actions to occur depending on the situation.",
      "How do if statements work?":
          "If statements work by using a conditional statement (e.g. x < 10) to proceed with code within it.",
      "What is the purpose of nested if statements?":
          "Nested if statements (if statements within if statements) allow for different outcomes depending on a variable.",
      "What is the purpose of a loop?":
          "Loops are used to run a certain section of code multiple times, sometimes with differing values by altering variables. ",
      "What are the types of loops?":
          'Loops are used to run a certain section of code multiple times, sometimes with differing values by altering variables.',
      "How do loops work?":
          "In Python, there are 2 standard loops, the while loop and for loop. The while loop takes a condition and continues the code indented beneath it until the condition is proven false. The for loop takes a variable and a range, repeating the code within it depending on its range. This variable can then be used within the loop to change values depending on what the programmer wants. Another way a for loop can be used is to take the values contained in e.g. a list and iterate (go through the values) through that list, using it with the code contained within.",
      "What is the purpose of a function?":
          'The purpose of a function is to repeat a certain piece of code, sometimes with different values. These different values are called parameters and will change the returned value.',
      'How do functions work?':
          'In Python, a function is first defined, with its name and parameters. The name is what will be called and its parameters will have values inputted within a set of brackets when it is called. Within a function, a programmer can access the parameters by calling their variable names, however when used, the parameters that are inputted with the function will replace these variable names leading to different results.',
      'What is recommended when it comes to function use and placement?':
          'A function is recommended to be located at the beginning of the program, not access variables outside of itself/its parameters and return its results.',
    };

    List<String> questionKeys = [];

    var questionEntries = questionAnswer.entries.toList();

    for (var i = 0; i < questionEntries.length; i++) {
      questionKeys.add(questionEntries[i].key);
    }

    print(questionKeys);

    _questionAnswer(Question, Answer) {
      return Padding(
          padding: const EdgeInsets.only(right: 60),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text(
                          'Answer',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      body: Wrap(children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(Answer, softWrap: true),
                        ),
                      ]),
                    );
                  }),
                );
              },
              child: Card(
                  color: Colors.grey,
                  shadowColor: Colors.purple,
                  elevation: 20,
                  child: Container(
                      height: 450,
                      width: 450,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            opacity: 0.6,
                            image: AssetImage("images/pingu.jpeg")),
                      ),
                      child: Center(
                        child: Text(
                          "$Question",
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 30,
                            color: Colors.white,
                            backgroundColor: Color.fromARGB(137, 158, 158, 158),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )))));
    }

    return DefaultTabController(
      // Base Tab Format creating Tab Bar and TabBarView
      animationDuration: Durations.short4,
      length: 3,
      child: Scaffold(
        // App Bar
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text(
            'Programming Culminating - Anish Sinha Roy',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          leading: const Icon(Icons.schema, color: Colors.white), // Logo????

          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              // Tab Icons
              Tab(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.abc,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.question_answer,
                  color: Colors.white,
                ),
              )
            ],
          ),
          actions: [
            // Search Bar
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              tooltip: 'Searchbar',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text(
                            'Search',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Autocomplete(
                            optionsBuilder:
                                (TextEditingValue textEditingValue) {
                              if (textEditingValue.text == '') {
                                return const Iterable<String>.empty();
                              }
                              return tabs.where((String option) {
                                return option.contains(
                                    textEditingValue.text.toLowerCase());
                              });
                            },
                            fieldViewBuilder: (BuildContext context,
                                TextEditingController textEditingController,
                                FocusNode fieldFocusNode,
                                VoidCallback onFieldSubmitted) {
                              return TextField(
                                autocorrect: true,
                                enableSuggestions: true,
                                controller: textEditingController,
                                focusNode: fieldFocusNode,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.search),
                                  labelText:
                                      'Type Here (Click on the Autofill options, '
                                      '|'
                                      ' for all options)',
                                ),
                                onSubmitted: (text) {
                                  String x = textEditingController.text;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return Scaffold(
                                        appBar: AppBar(
                                          title: const Text(
                                            'Search',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                        ),
                                        body: Wrap(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(_information[x]!,
                                                softWrap: true),
                                          ),
                                        ]),
                                      );
                                    }),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
        body: TabBarView(
          // Main Body
          controller: _tabController,
          children: [
            // Home Page
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: ElevatedButton(
                          // Button to second tab
                          onPressed: () => _tabController.index = 1,
                          child: Card(
                            color: Colors.grey,
                            shadowColor: Colors.purple,
                            elevation: 20,
                            child: Container(
                              height: 450,
                              width: 450,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    opacity: 0.6,
                                    image: AssetImage("images/pingu.jpeg")),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "Code/Explanation Section",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 30,
                                      color: Colors.white,
                                      backgroundColor:
                                          Color.fromARGB(137, 158, 158, 158),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: ElevatedButton(
                          onPressed: () => _tabController.index = 2,
                          child: Card(
                            color: Colors.grey,
                            shadowColor: Colors.purple,
                            elevation: 20,
                            child: Container(
                              height: 450,
                              width: 450,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    opacity: 0.6,
                                    image: AssetImage("images/pingu.jpeg")),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "Question/Answer Section",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 30,
                                      color: Colors.white,
                                      backgroundColor:
                                          Color.fromARGB(137, 158, 158, 158),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buttonCode('Documentation', '/code-explanation-documentation'),
                _buttonCode('Variables', '/code-explanation-variables'),
                _buttonCode('If Statements', '/code-explanation-if-statements'),
                _buttonCode('Loops', '/code-explanation-loops'),
                _buttonCode('Functions', '/code-explanation-functions')
              ],
            ),

            ListView(
                //scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  for (var y = 0; y < questionKeys.length; y++)
                    _questionAnswer(
                        questionKeys[y], questionAnswer[questionKeys[y]]),
                ]),
          ],
        ),
      ),
    );
  }
}

class ceDocPage extends StatelessWidget {
  ceDocPage({super.key});

  final Map<String, String> _information = {
    'Documentation | Purpose':
        'Documentation is to improve code readability, understanding, and address the creator of the program, when they made and last edited the program.',
    'Documentation | How it works':
        'The header is in a specific format, following the order of name, purpose, author, created and updated. Variable naming makes sense and fits into the code well. Comments are made in specific amounts to explain the code around it so that another programmer can understand it and edit it easier without having to spend time thoroughly reading through the program. Variables are also named clearly, according to either pothole case or camelcase and make sense towards the overall program. ',
    'Documentation | How is it used':
        'This boolean is used to determine whether a while loop continues or stops. It is altered later in the code depending on inputs from the user asking it to stop.',
    'Documentation | Missing':
        'Occasionally, I do not make my variables detailed enough. Sometimes I used single letters for variables which do not tell people their purpose.',
    'Variables | Purpose':
        'Variables are a way to store values within a code, including strings, integers and booleans.',
    'Variables | How is it used':
        'The max_Amount variable takes 2 and uses the power of the amount of binary digits to determine the maximum amount the binary can be. This works because binary is a base 2 system. The code is then made to divide the max_Amount variable by 2, and add it depending on its digit (0 or 1). This variable is only used and changed during the num_to_bin() function where the binary and decimal values are converted interchangeably. It is not required outside of the function.',
    'Variables | How it works':
        'In Python, a variable is assigned a name followed by an equal sign and then a value. These values are generally integers, strings and booleans.',
    'Variables | Missing':
        'In Example 1 and 2, the naming of the variable is incorrect as they do not use either pothole case or camel case, instead combining them. ',
    'If Statements | Purpose':
        'If statements are conditionals to allow for different actions to occur depending on the situation.',
    'If Statements | How it works':
        'This code uses if statements and changes to variables. The multiple if statements that are nested within the if statement allow for different variable values to create different outcomes.',
    'If Statements | How it is used':
        'This code first checks whether the accuracy passes the random check (meaning they hit their target). It then checks if it is a basic attack (skillAttacker == 0), skill or if they do not have enough SP for an attack. If they do not pass the accuracy test, they miss.',
    'Loops | Purpose':
        'Loops are used to run a certain section of code multiple times, sometimes with differing values by altering variables.',
    'Loops | How it works':
        'In Python, there are 2 standard loops, the while loop and for loop. The while loop takes a condition and continues the code indented beneath it until the condition is proven false (Example 1). The for loop takes a variable and a range, repeating the code within it depending on its range. This variable can then be used within the loop to change values depending on what the programmer wants (Example 2). Another way a for loop can be used is to take the values contained in e.g. a list and iterate (go through the values) through that list, using it with the code contained within (Example 3).',
    'Loops | How it is used':
        'Example 1 works by looping until a condition is proven false. Example 2 is more complicated, using two for loops to loop through multiple lists and list values using an if statement to check and assign values. Example 3 works by going through two lists and assigning them increasing values as the loop progresses. For example, an upper_case ‘A’ would first create a key with the same letter and then create the binary value based on the amount of times the loop has run. ',
    'Functions | Purpose':
        'The purpose of a function is to repeat a certain piece of code, sometimes with different values. These different values are called parameters and will change the returned value. ',
    'Functions | How it works':
        'In Python, a function is first defined, with its name and parameters. The name is what will be called and its parameters will have values inputted within a set of brackets when it is called. A function is recommended to be located at the beginning of the program, not access variables outside of itself/its parameters and return its results. Within a function, a programmer can access the parameters by calling their variable names, however when used, the parameters that are inputted with the function will replace these variable names leading to different results.',
    'Functions | How it is used':
        'In Example 3, the function is called with many parameters being accessed through lists and dictionaries. These list and dictionary values are related to the necessary parameters, which is shown in Example 1. Finally, the parameters are used throughout the function, Example 2 showing one of the cases.',
  };

  ceDocPageMyWidget({key}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Documentation',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Row(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.blueGrey[200],
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 50.0, right: 8.0, bottom: 4.0),
                    child: SizedBox(
                        width: 400,
                        height: 75,
                        child: Text(_information["Documentation | Purpose"]!)),
                  ),
                ),
                Container(
                  color: Colors.blueGrey[200],
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 50.0, right: 8.0, bottom: 8.0),
                    child: SizedBox(
                        width: 400,
                        height: 80,
                        child: Text(
                            _information["Documentation | How it works"]!)),
                  ),
                ),
                Container(
                  color: Colors.blueGrey[200],
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 50.0, right: 8.0, bottom: 4.0),
                    child: SizedBox(
                        width: 400,
                        height: 75,
                        child: Text(
                            _information["Documentation | How is it used"]!)),
                  ),
                ),
                Container(
                  color: Colors.blueGrey[200],
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, left: 50.0, right: 8.0, bottom: 8.0),
                    child: SizedBox(
                        width: 400,
                        height: 60,
                        child: Text(_information["Documentation | Missing"]!)),
                  ),
                ),
              ]),
          Padding(
            padding: const EdgeInsets.only(left: 200.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 1,
                        image: AssetImage("images/Documentation 1.png")),
                  ),
                ),
                Container(
                  height: 200,
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 1,
                        image: AssetImage("images/documentation 2.png")),
                  ),
                ),
                Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: const DecorationImage(
                        fit: BoxFit.contain,
                        opacity: 1,
                        image: AssetImage("images/documentation.png")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ceVarPage extends StatelessWidget {
  ceVarPage({super.key});

  ceVarPageMyWidget({key}) {}

  final Map<String, String> _information = {
    'Documentation | Purpose':
        'Documentation is to improve code readability, understanding, and address the creator of the program, when they made and last edited the program.',
    'Documentation | How it works':
        'The header is in a specific format, following the order of name, purpose, author, created and updated. Variable naming makes sense and fits into the code well. Comments are made in specific amounts to explain the code around it so that another programmer can understand it and edit it easier without having to spend time thoroughly reading through the program. Variables are also named clearly, according to either pothole case or camelcase and make sense towards the overall program. ',
    'Documentation | How is it used':
        'This boolean is used to determine whether a while loop continues or stops. It is altered later in the code depending on inputs from the user asking it to stop.',
    'Documentation | Missing':
        'Occasionally, I do not make my variables detailed enough. Sometimes I used single letters for variables which do not tell people their purpose.',
    'Variables | Purpose':
        'Variable with a value acting as a placeholder. Determines the maximum amount in the binary conversion.',
    'Variables | How is it used':
        'The max_Amount variable takes 2 and uses the power of the amount of binary digits to determine the maximum amount the binary can be. This works because binary is a base 2 system. The code is then made to divide the max_Amount variable by 2, and add it depending on its digit (0 or 1). This variable is only used and changed during the num_to_bin() function where the binary and decimal values are converted interchangeably. It is not required outside of the function.',
    'Variables | How it works':
        'In Python, a variable is assigned a name followed by an equal sign and then a value. These values are generally integers, strings and booleans.',
    'Variables | Missing':
        'In Example 1 and 2, the naming of the variable is incorrect as they do not use either pothole case or camel case, instead combining them. ',
    'If Statements | Purpose':
        'If statements are conditionals to allow for different actions to occur depending on the situation.',
    'If Statements | How it works':
        'This code uses if statements and changes to variables. The multiple if statements that are nested within the if statement allow for different variable values to create different outcomes.',
    'If Statements | How it is used':
        'This code first checks whether the accuracy passes the random check (meaning they hit their target). It then checks if it is a basic attack (skillAttacker == 0), skill or if they do not have enough SP for an attack. If they do not pass the accuracy test, they miss.',
    'Loops | Purpose':
        'Loops are used to run a certain section of code multiple times, sometimes with differing values by altering variables.',
    'Loops | How it works':
        'In Python, there are 2 standard loops, the while loop and for loop. The while loop takes a condition and continues the code indented beneath it until the condition is proven false (Example 1). The for loop takes a variable and a range, repeating the code within it depending on its range. This variable can then be used within the loop to change values depending on what the programmer wants (Example 2). Another way a for loop can be used is to take the values contained in e.g. a list and iterate (go through the values) through that list, using it with the code contained within (Example 3).',
    'Loops | How it is used':
        'Example 1 works by looping until a condition is proven false. Example 2 is more complicated, using two for loops to loop through multiple lists and list values using an if statement to check and assign values. Example 3 works by going through two lists and assigning them increasing values as the loop progresses. For example, an upper_case ‘A’ would first create a key with the same letter and then create the binary value based on the amount of times the loop has run. ',
    'Functions | Purpose':
        'The purpose of a function is to repeat a certain piece of code, sometimes with different values. These different values are called parameters and will change the returned value. ',
    'Functions | How it works':
        'In Python, a function is first defined, with its name and parameters. The name is what will be called and its parameters will have values inputted within a set of brackets when it is called. A function is recommended to be located at the beginning of the program, not access variables outside of itself/its parameters and return its results. Within a function, a programmer can access the parameters by calling their variable names, however when used, the parameters that are inputted with the function will replace these variable names leading to different results.',
    'Functions | How it is used':
        'In Example 3, the function is called with many parameters being accessed through lists and dictionaries. These list and dictionary values are related to the necessary parameters, which is shown in Example 1. Finally, the parameters are used throughout the function, Example 2 showing one of the cases.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Variables',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Row(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              color: Colors.blueGrey[200],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 50.0, right: 8.0, bottom: 4.0),
                child: SizedBox(
                    width: 400,
                    height: 40,
                    child: Text(_information["Variables | Purpose"]!)),
              ),
            ),
            Container(
              color: Colors.blueGrey[200],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 50.0, right: 8.0, bottom: 4.0),
                child: SizedBox(
                    width: 400,
                    height: 65,
                    child: Text(_information["Variables | How it works"]!)),
              ),
            ),
            Container(
              color: Colors.blueGrey[200],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 50.0, right: 8.0, bottom: 4.0),
                child: SizedBox(
                    width: 400,
                    height: 170,
                    child: Text(_information["Variables | How is it used"]!)),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 200.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: const DecorationImage(
                        fit: BoxFit.contain,
                        opacity: 1,
                        image: AssetImage("images/Variables 1.png")),
                  ),
                ),
                Container(
                  height: 200,
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: const DecorationImage(
                        fit: BoxFit.contain,
                        opacity: 1,
                        image: AssetImage("images/Variables 2.png")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ceIfPage extends StatelessWidget {
  ceIfPage({super.key});

  ceIfPageMyWidget({key}) {}

  final Map<String, String> _information = {
    'Documentation | Purpose':
        'Documentation is to improve code readability, understanding, and address the creator of the program, when they made and last edited the program.',
    'Documentation | How it works':
        'The header is in a specific format, following the order of name, purpose, author, created and updated. Variable naming makes sense and fits into the code well. Comments are made in specific amounts to explain the code around it so that another programmer can understand it and edit it easier without having to spend time thoroughly reading through the program. Variables are also named clearly, according to either pothole case or camelcase and make sense towards the overall program. ',
    'Documentation | How is it used':
        'This boolean is used to determine whether a while loop continues or stops. It is altered later in the code depending on inputs from the user asking it to stop.',
    'Documentation | Missing':
        'Occasionally, I do not make my variables detailed enough. Sometimes I used single letters for variables which do not tell people their purpose.',
    'Variables | Purpose':
        'Variable with a value acting as a placeholder. Determines the maximum amount in the binary conversion.',
    'Variables | How is it used':
        'The max_Amount variable takes 2 and uses the power of the amount of binary digits to determine the maximum amount the binary can be. This works because binary is a base 2 system. The code is then made to divide the max_Amount variable by 2, and add it depending on its digit (0 or 1). This variable is only used and changed during the num_to_bin() function where the binary and decimal values are converted interchangeably. It is not required outside of the function.',
    'Variables | How it works':
        'In Python, a variable is assigned a name followed by an equal sign and then a value. These values are generally integers, strings and booleans.',
    'Variables | Missing':
        'In Example 1 and 2, the naming of the variable is incorrect as they do not use either pothole case or camel case, instead combining them. ',
    'If Statements | Purpose':
        'If statements are conditionals to allow for different actions to occur depending on the situation.',
    'If Statements | How it works':
        'This code uses if statements and changes to variables. The multiple if statements that are nested within the if statement allow for different variable values to create different outcomes.',
    'If Statements | How it is used':
        'This code first checks whether the accuracy passes the random check (meaning they hit their target). It then checks if it is a basic attack (skillAttacker == 0), skill or if they do not have enough SP for an attack. If they do not pass the accuracy test, they miss.',
    'Loops | Purpose':
        'Loops are used to run a certain section of code multiple times, sometimes with differing values by altering variables.',
    'Loops | How it works':
        'In Python, there are 2 standard loops, the while loop and for loop. The while loop takes a condition and continues the code indented beneath it until the condition is proven false (Example 1). The for loop takes a variable and a range, repeating the code within it depending on its range. This variable can then be used within the loop to change values depending on what the programmer wants (Example 2). Another way a for loop can be used is to take the values contained in e.g. a list and iterate (go through the values) through that list, using it with the code contained within (Example 3).',
    'Loops | How it is used':
        'Example 1 works by looping until a condition is proven false. Example 2 is more complicated, using two for loops to loop through multiple lists and list values using an if statement to check and assign values. Example 3 works by going through two lists and assigning them increasing values as the loop progresses. For example, an upper_case ‘A’ would first create a key with the same letter and then create the binary value based on the amount of times the loop has run. ',
    'Functions | Purpose':
        'The purpose of a function is to repeat a certain piece of code, sometimes with different values. These different values are called parameters and will change the returned value. ',
    'Functions | How it works':
        'In Python, a function is first defined, with its name and parameters. The name is what will be called and its parameters will have values inputted within a set of brackets when it is called. A function is recommended to be located at the beginning of the program, not access variables outside of itself/its parameters and return its results. Within a function, a programmer can access the parameters by calling their variable names, however when used, the parameters that are inputted with the function will replace these variable names leading to different results.',
    'Functions | How it is used':
        'In Example 3, the function is called with many parameters being accessed through lists and dictionaries. These list and dictionary values are related to the necessary parameters, which is shown in Example 1. Finally, the parameters are used throughout the function, Example 2 showing one of the cases.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'If Statements',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Row(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              color: Colors.blueGrey[200],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 50.0, right: 8.0, bottom: 4.0),
                child: SizedBox(
                    width: 400,
                    height: 50,
                    child: Text(_information["If Statements | Purpose"]!)),
              ),
            ),
            Container(
              color: Colors.blueGrey[200],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, left: 50.0, right: 8.0, bottom: 8.0),
                child: SizedBox(
                    width: 400,
                    height: 80,
                    child: Text(_information["If Statements | How it works"]!)),
              ),
            ),
            Container(
              color: Colors.blueGrey[200],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 50.0, right: 8.0, bottom: 4.0),
                child: SizedBox(
                    width: 400,
                    height: 107,
                    child:
                        Text(_information["If Statements | How it is used"]!)),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 200.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 800,
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: const DecorationImage(
                        fit: BoxFit.contain,
                        opacity: 1,
                        image: AssetImage("images/If Statements 1.png")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ceLoopsPage extends StatelessWidget {
  ceLoopsPage({super.key});

  ceLoopsPageMyWidget({key}) {}

  final Map<String, String> _information = {
    'Documentation | Purpose':
        'Documentation is to improve code readability, understanding, and address the creator of the program, when they made and last edited the program.',
    'Documentation | How it works':
        'The header is in a specific format, following the order of name, purpose, author, created and updated. Variable naming makes sense and fits into the code well. Comments are made in specific amounts to explain the code around it so that another programmer can understand it and edit it easier without having to spend time thoroughly reading through the program. Variables are also named clearly, according to either pothole case or camelcase and make sense towards the overall program. ',
    'Documentation | How is it used':
        'This boolean is used to determine whether a while loop continues or stops. It is altered later in the code depending on inputs from the user asking it to stop.',
    'Documentation | Missing':
        'Occasionally, I do not make my variables detailed enough. Sometimes I used single letters for variables which do not tell people their purpose.',
    'Variables | Purpose':
        'Variable with a value acting as a placeholder. Determines the maximum amount in the binary conversion.',
    'Variables | How is it used':
        'The max_Amount variable takes 2 and uses the power of the amount of binary digits to determine the maximum amount the binary can be. This works because binary is a base 2 system. The code is then made to divide the max_Amount variable by 2, and add it depending on its digit (0 or 1). This variable is only used and changed during the num_to_bin() function where the binary and decimal values are converted interchangeably. It is not required outside of the function.',
    'Variables | How it works':
        'In Python, a variable is assigned a name followed by an equal sign and then a value. These values are generally integers, strings and booleans.',
    'Variables | Missing':
        'In Example 1 and 2, the naming of the variable is incorrect as they do not use either pothole case or camel case, instead combining them. ',
    'If Statements | Purpose':
        'If statements are conditionals to allow for different actions to occur depending on the situation.',
    'If Statements | How it works':
        'This code uses if statements and changes to variables. The multiple if statements that are nested within the if statement allow for different variable values to create different outcomes.',
    'If Statements | How it is used':
        'This code first checks whether the accuracy passes the random check (meaning they hit their target). It then checks if it is a basic attack (skillAttacker == 0), skill or if they do not have enough SP for an attack. If they do not pass the accuracy test, they miss.',
    'Loops | Purpose':
        'Loops are used to run a certain section of code multiple times, sometimes with differing values by altering variables.',
    'Loops | How it works':
        'In Python, there are 2 standard loops, the while loop and for loop. The while loop takes a condition and continues the code indented beneath it until the condition is proven false (Example 1). The for loop takes a variable and a range, repeating the code within it depending on its range. This variable can then be used within the loop to change values depending on what the programmer wants (Example 2). Another way a for loop can be used is to take the values contained in e.g. a list and iterate (go through the values) through that list, using it with the code contained within (Example 3).',
    'Loops | How it is used':
        'Example 1 works by looping until a condition is proven false. Example 2 is more complicated, using two for loops to loop through multiple lists and list values using an if statement to check and assign values. Example 3 works by going through two lists and assigning them increasing values as the loop progresses. For example, an upper_case ‘A’ would first create a key with the same letter and then create the binary value based on the amount of times the loop has run. ',
    'Functions | Purpose':
        'The purpose of a function is to repeat a certain piece of code, sometimes with different values. These different values are called parameters and will change the returned value. ',
    'Functions | How it works':
        'In Python, a function is first defined, with its name and parameters. The name is what will be called and its parameters will have values inputted within a set of brackets when it is called. A function is recommended to be located at the beginning of the program, not access variables outside of itself/its parameters and return its results. Within a function, a programmer can access the parameters by calling their variable names, however when used, the parameters that are inputted with the function will replace these variable names leading to different results.',
    'Functions | How it is used':
        'In Example 3, the function is called with many parameters being accessed through lists and dictionaries. These list and dictionary values are related to the necessary parameters, which is shown in Example 1. Finally, the parameters are used throughout the function, Example 2 showing one of the cases.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Loops',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Row(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              color: Colors.blueGrey[200],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 50.0, right: 8.0, bottom: 4.0),
                child: SizedBox(
                    width: 400,
                    height: 40,
                    child: Text(_information["Loops | Purpose"]!)),
              ),
            ),
            Container(
              color: Colors.blueGrey[200],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, left: 50.0, right: 8.0, bottom: 8.0),
                child: SizedBox(
                    width: 400,
                    height: 200,
                    child: Text(_information["Loops | How it works"]!)),
              ),
            ),
            Container(
              color: Colors.blueGrey[200],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, left: 50.0, right: 8.0, bottom: 4.0),
                child: SizedBox(
                    width: 400,
                    height: 160,
                    child: Text(_information["Loops | How it is used"]!)),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 200.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: const DecorationImage(
                        fit: BoxFit.contain,
                        opacity: 1,
                        image: AssetImage("images/Loops.png")),
                  ),
                ),
                Container(
                  height: 200,
                  width: 900,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: const DecorationImage(
                        fit: BoxFit.contain,
                        opacity: 1,
                        image: AssetImage("images/Loops 1.png")),
                  ),
                ),
                Container(
                  height: 200,
                  width: 900,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: const DecorationImage(
                        fit: BoxFit.contain,
                        opacity: 1,
                        image: AssetImage("images/Loops 2.png")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ceFunctionsPage extends StatelessWidget {
  ceFunctionsPage({super.key});

  ceFunctionsPageMyWidget({key}) {}

  final Map<String, String> _information = {
    'Documentation | Purpose':
        'Documentation is to improve code readability, understanding, and address the creator of the program, when they made and last edited the program.',
    'Documentation | How it works':
        'The header is in a specific format, following the order of name, purpose, author, created and updated. Variable naming makes sense and fits into the code well. Comments are made in specific amounts to explain the code around it so that another programmer can understand it and edit it easier without having to spend time thoroughly reading through the program. Variables are also named clearly, according to either pothole case or camelcase and make sense towards the overall program. ',
    'Documentation | How is it used':
        'This boolean is used to determine whether a while loop continues or stops. It is altered later in the code depending on inputs from the user asking it to stop.',
    'Documentation | Missing':
        'Occasionally, I do not make my variables detailed enough. Sometimes I used single letters for variables which do not tell people their purpose.',
    'Variables | Purpose':
        'Variable with a value acting as a placeholder. Determines the maximum amount in the binary conversion.',
    'Variables | How is it used':
        'The max_Amount variable takes 2 and uses the power of the amount of binary digits to determine the maximum amount the binary can be. This works because binary is a base 2 system. The code is then made to divide the max_Amount variable by 2, and add it depending on its digit (0 or 1). This variable is only used and changed during the num_to_bin() function where the binary and decimal values are converted interchangeably. It is not required outside of the function.',
    'Variables | How it works':
        'In Python, a variable is assigned a name followed by an equal sign and then a value. These values are generally integers, strings and booleans.',
    'Variables | Missing':
        'In Example 1 and 2, the naming of the variable is incorrect as they do not use either pothole case or camel case, instead combining them. ',
    'If Statements | Purpose':
        'If statements are conditionals to allow for different actions to occur depending on the situation.',
    'If Statements | How it works':
        'This code uses if statements and changes to variables. The multiple if statements that are nested within the if statement allow for different variable values to create different outcomes.',
    'If Statements | How it is used':
        'This code first checks whether the accuracy passes the random check (meaning they hit their target). It then checks if it is a basic attack (skillAttacker == 0), skill or if they do not have enough SP for an attack. If they do not pass the accuracy test, they miss.',
    'Loops | Purpose':
        'Loops are used to run a certain section of code multiple times, sometimes with differing values by altering variables.',
    'Loops | How it works':
        'In Python, there are 2 standard loops, the while loop and for loop. The while loop takes a condition and continues the code indented beneath it until the condition is proven false (Example 1). The for loop takes a variable and a range, repeating the code within it depending on its range. This variable can then be used within the loop to change values depending on what the programmer wants (Example 2). Another way a for loop can be used is to take the values contained in e.g. a list and iterate (go through the values) through that list, using it with the code contained within (Example 3).',
    'Loops | How it is used':
        'Example 1 works by looping until a condition is proven false. Example 2 is more complicated, using two for loops to loop through multiple lists and list values using an if statement to check and assign values. Example 3 works by going through two lists and assigning them increasing values as the loop progresses. For example, an upper_case ‘A’ would first create a key with the same letter and then create the binary value based on the amount of times the loop has run. ',
    'Functions | Purpose':
        'The purpose of a function is to repeat a certain piece of code, sometimes with different values. These different values are called parameters and will change the returned value. ',
    'Functions | How it works':
        'In Python, a function is first defined, with its name and parameters. The name is what will be called and its parameters will have values inputted within a set of brackets when it is called. A function is recommended to be located at the beginning of the program, not access variables outside of itself/its parameters and return its results. Within a function, a programmer can access the parameters by calling their variable names, however when used, the parameters that are inputted with the function will replace these variable names leading to different results.',
    'Functions | How it is used':
        'In Example 3, the function is called with many parameters being accessed through lists and dictionaries. These list and dictionary values are related to the necessary parameters, which is shown in Example 1. Finally, the parameters are used throughout the function, Example 2 showing one of the cases.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Functions',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Row(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              color: Colors.blueGrey[200],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 50.0, right: 8.0, bottom: 4.0),
                child: SizedBox(
                    width: 400,
                    height: 40,
                    child: Text(_information["Functions | Purpose"]!)),
              ),
            ),
            Container(
              color: Colors.blueGrey[200],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, left: 50.0, right: 8.0, bottom: 8.0),
                child: SizedBox(
                    width: 400,
                    height: 200,
                    child: Text(_information["Functions | How it works"]!)),
              ),
            ),
            Container(
              color: Colors.blueGrey[200],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, left: 50.0, right: 8.0, bottom: 4.0),
                child: SizedBox(
                    width: 400,
                    height: 105,
                    child: Text(_information["Functions | How it is used"]!)),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 200.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: const DecorationImage(
                        fit: BoxFit.contain,
                        opacity: 1,
                        image: AssetImage("images/Functions 1.png")),
                  ),
                ),
                Container(
                  height: 100,
                  width: 600,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: const DecorationImage(
                        fit: BoxFit.contain,
                        opacity: 1,
                        image: AssetImage("images/Functions 2.png")),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 100.0),
                  height: 100,
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: const DecorationImage(
                        fit: BoxFit.contain,
                        opacity: 1,
                        image: AssetImage("images/Functions 3.png")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
