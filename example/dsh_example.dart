import 'package:dsh/dsh.dart';

void main() {
  demo();
  demo1();
  demo2();
  demo3();
  demo4();
}

void demo() {
  $('ls -l');
  $('echo hello');
}

void demo1() {
  int num = 10;
  String dir = 'demo1';

  $('echo $num');
  $('mkdir -p $dir');
}

void demo2() async {
  int a = 10;
  String dir = 'demo2';

  await $('echo $a');
  await $('mkdir -p $dir');
  await $('ls');
  await $('sleep 3');
}

void demo3() async {
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

void demo4() {
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
