// ignore_for_file: avoid_print

import 'dart:io';

void main() {
  const baseDir = '/home/ansh/Studio Projects/Clone/baby_package/lib';
  final mainBarrelFile = File('$baseDir/my_system.dart');

  try {
    mainBarrelFile.writeAsStringSync(
      '// Auto-generated main barrel file\n\n',
    );

    processDirectory(Directory(baseDir), mainBarrelFile);

    print('All barrel files generated and main barrel file updated!');
  } catch (e) {
    print('Error: $e');
  }
}

void processDirectory(Directory dir, File mainBarrelFile) {
  print('Processing directory: ${dir.path}');

  try {
    final dartFiles = <String>[];
    dir.listSync().forEach((entity) {
      if (entity is File &&
          entity.path.endsWith('.dart') &&
          !entity.path.endsWith('my_system.dart') &&
          !entity.path.endsWith('_barrel.dart')) {
        // Skip existing barrel files
        final fileName = entity.path.split('/').last;
        if (!fileName.startsWith('.')) {
          dartFiles.add(fileName);
        }
      }
    });

    if (dartFiles.isNotEmpty) {
      final folderName = dir.path.split('/').last;
      // Add _barrel to the filename
      final barrelFile = File('${dir.path}/${folderName}_barrel.dart');

      dartFiles.sort();
      barrelFile.writeAsStringSync(
        '// Auto-generated barrel file for $folderName\n\n',
      );

      for (final fileName in dartFiles) {
        if (fileName != '${folderName}_barrel.dart') {
          barrelFile.writeAsStringSync(
            "export '$fileName';\n",
            mode: FileMode.append,
          );
        }
      }

      if (dir.path != mainBarrelFile.parent.path) {
        final relativePath = dir.path.split('lib/')[1];
        mainBarrelFile.writeAsStringSync(
          "export '$relativePath/${folderName}_barrel.dart';\n",
          mode: FileMode.append,
        );
      }
    }

    dir.listSync().forEach((entity) {
      if (entity is Directory) {
        processDirectory(entity, mainBarrelFile);
      }
    });
  } catch (e) {
    print('Error processing ${dir.path}: $e');
  }
}
