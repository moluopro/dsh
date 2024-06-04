## DSH: Dart Shell
Use shell for automation in Dart, inspired by [google/zx](https://google.github.io/zx)  

## Quick Start

The simplest example:  
```dart
import 'package:sh/sh.dart';

void main() {
  $('ls -l');
  $('echo hello');
}
```

Passing variables to the shell:  
```dart
import 'package:sh/sh.dart';

void main() {
  int num = 10;
  String dir = 'demo1';

  $('echo $num');
  $('mkdir -p $dir');
}
```

Executing shell commands sequentially:  
```dart
import 'package:sh/sh.dart';

void main() async {
  int a = 10;
  String dir = 'demo2';

  await $('echo $a');
  await $('mkdir -p $dir');
  await $('ls');
  await $('sleep 3');
}
```

Asynchronously executing multiple commands:  
```dart
import 'package:sh/sh.dart';

void main() async {
  // Execute commands concurrently
  // Wait for all concurrent commands to complete
  await Future.wait([
    $('(sleep 1; echo 1)'),
    $('(sleep 2; echo 2)'),
    $('(sleep 3; echo 3)'),
    $('(sleep 4; echo 4)'),
    $('(sleep 5; echo 5)')
  ]);
}
```

Directly executing a shell script:  
```dart
import 'package:sh/sh.dart';

void main() {
  String dir = 'demo4';

  $('''
  cd $dir
  touch help.txt
  ls
  cd ..
  rm -rf $dir
  (sleep 1; echo 1)
  (sleep 2; echo 2)
  (sleep 3; echo 3)
  ''');
}
```