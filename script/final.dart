// ignore_for_file: avoid_print

import 'dart:io';

void main() {
  const baseDir = '/home/ansh/Studio Projects/Clone/baby_package/lib';
  
  try {
    // Process src directory to create feature barrel files
    createFeatureBarrels(baseDir);
    print('All feature barrel files generated!');
  } catch (e) {
    print('Error: $e');
  }
}

void createFeatureBarrels(String basePath) {
  final srcDir = Directory('$basePath/src');
  if (!srcDir.existsSync()) {
    print('src directory not found');
    return;
  }

  // Process each feature directory in src
  srcDir.listSync().forEach((entity) {
    if (entity is Directory) {
      final featureName = entity.path.split('/').last;
      processFeatureDirectory(entity, basePath, featureName);
    }
  });
}

void processFeatureDirectory(Directory featureDir, String basePath, String featureName) {
  print('Processing feature: $featureName');

  try {
    // Collect all dart files in the feature directory
    final dartFiles = <String>[];
    featureDir.listSync(recursive: true).forEach((entity) {
      if (entity is File && 
          entity.path.endsWith('.dart') &&
          !entity.path.endsWith('_barrel.dart')) {
        // Get relative path from feature directory
        final relativePath = entity.path.split('${featureDir.path}/')[1];
        dartFiles.add(relativePath);
      }
    });

    if (dartFiles.isNotEmpty) {
      // Create feature barrel file in lib directory
      final barrelFile = File('$basePath/$featureName.dart');
      
      // Write header
      barrelFile.writeAsStringSync(
        '// Auto-generated barrel file for $featureName\n\n'
      );

      // Sort and write exports
      dartFiles.sort();
      for (final filePath in dartFiles) {
        barrelFile.writeAsStringSync(
          "export 'src/$featureName/$filePath';\n",
          mode: FileMode.append
        );
      }

      print('Generated barrel file for $featureName with ${dartFiles.length} exports');
    }

  } catch (e) {
    print('Error processing feature $featureName: $e');
  }
}