//  Copyright [2024] [MoluoPro](https://github.com/moluopro)
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

/// The `dsh` library provides functionalities to execute shell commands in Dart
/// asynchronously. It is designed to be similar to the zx library from Google.
///
/// To use this library, import it as follows:
/// ```dart
/// import 'package:dsh/dsh.dart';
/// ```
///
/// Example usage:
/// ```dart
/// import 'package:dsh/dsh.dart';
///
/// void main() async {
///   await $('echo Hello');
/// }
/// ```

library dsh;

// Export the main functionality of the library.
export 'src/dsh_base.dart';
