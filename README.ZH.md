## DSH: Dart Shell
在Dart中使用shell进行自动化工作，灵感来自于[google/zx](https://google.github.io/zx)  

## 快速入门  

最简单的例子：
```dart
import 'package:sh/sh.dart';

void main() {
  $('ls -l');
  $('echo hello');
}
```  

向Shell中传递变量：  
```dart
import 'package:sh/sh.dart';

void main() {
  int num = 10;
  String dir = 'demo1';

  $('echo $num');
  $('mkdir -p $dir');
}
```  

按顺序执行shell命令：  
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

异步执行多条命令：  
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

直接执行shell脚本：  
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