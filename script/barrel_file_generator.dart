// ignore_for_file: avoid_print, cascade_invocations

import 'dart:io';

extension ObjectExt on Object {
  void printFirst({String message = ''}) {}
}

void main(List<String> args) {
  try {
    // Test all operations
    //  directoryOps();
    writeFile();
    // readFile();
    firstTest();
  } catch (e) {
    e.printFirst();
  }
}

void firstTest() {
  const baseDir = 'lib/src/core/extension';
  final dir = Directory(baseDir);

  try {
    if (dir.existsSync()) {
      // Create barrel file (exception.dart)
      final folderName = dir.path.split('/').last;
      final barrelFile = File('${dir.path}/${folderName}_barrel.dart');

      // Initialize barrel file
      barrelFile.writeAsStringSync('// Auto-generated barrel file for $folderName\n\n');

      // Add exports for each dart file
      dir.listSync().forEach((entity) {
        if (entity is File) {
          final filePath = entity.path;
          if (filePath.endsWith('.dart') && !filePath.contains('barrel')) {
            final fileName = filePath.split('/').last;

            barrelFile.writeAsStringSync(
              "export '$fileName';\n",
              mode: FileMode.append,
            );

            barrelFile.writeAsStringSync(
              '',
              mode: FileMode.append,
            );
          }
        }
      });

      // Organize imports using dart fix
      Process.runSync(
        'dart',
        ['fix', '--apply', barrelFile.absolute.path],
      );

      Process.runSync('dart', ['format', barrelFile.path]);
    }
  } catch (e) {
    'error'.printFirst();
  }
}

void directoryOps() {
  final dir = Directory('test_folder'); // Changed name to be more descriptive

  try {
    // Create directory if it doesn't exist
    if (!dir.existsSync()) {
      // check directory
      dir.createSync(); // create directory
    }

    // Create some test files
    File('${dir.path}/test1.txt').writeAsStringSync(
      'Test file 1',
      mode: FileMode.append,
    );
    File('${dir.path}/test2.txt').writeAsStringSync(
      'Test file 2',
      mode: FileMode.append,
    );

    // Create a subdirectory
    Directory('${dir.path}/subdir').createSync();

    // List contents with detailed information
    dir.listSync().forEach((entity) {
      if (entity is File) {
      } else if (entity is Directory) {}
    });
  } catch (e) {
    e.printFirst();
  }
}

void writeFile() {
  try {
    final file = File('test_folder/test1.txt');

    // Write initial content
    file.writeAsStringSync('Hello World\n');

    // Append more content
    file.writeAsStringSync('New Line 1\n', mode: FileMode.append);
    file.writeAsStringSync('New Line 2\n', mode: FileMode.append);
  } catch (e) {
    e.printFirst();
  }
}

void readFile() {
  try {
    final file = File('test_output.txt');

    if (file.existsSync()) {
      // Synchronous read
      final contents = file.readAsStringSync();
      contents.printFirst();

      // Read lines in list
      final lines = file.readAsLinesSync();
      for (final line in lines) {
        line.printFirst();
      }
    }
  } catch (e) {
    e.printFirst();
  }
}
