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

import 'dart:io';
import 'dart:async';

/// The default shell to use for executing commands.
/// By default, it is set to "sh".
String shell = "sh";

/// Executes a shell command asynchronously.
///
/// This function uses the default shell specified by the [shell] variable to
/// execute the given [command]. The standard output and standard error of the
/// command are streamed to the current process's stdout and stderr, respectively.
///
/// Example:
/// ```dart
/// await $('echo Hello');
/// ```
///
/// If you want to change the default shell, you can modify the [shell] variable:
/// ```dart
/// shell = 'bash';
/// await $('echo HelloBash');
/// ```
///
/// [command] - The shell command to execute.
///
/// Returns a [Future] that completes when the command has finished executing.
Future<void> $(String command) async {
  // Use a Completer to control the completion of the Future
  var completer = Completer<void>();

  // Start a new process
  Process.start(shell, ['-c', command]).then((process) {
    // Handle standard output
    process.stdout.transform(SystemEncoding().decoder).listen((data) {
      stdout.write(data);
    });

    // Handle standard error
    process.stderr.transform(SystemEncoding().decoder).listen((data) {
      stderr.write(data);
    });

    // Complete the Completer when the process exits
    process.exitCode.then((code) {
      completer.complete();
    });
  });

  // Return the Completer's Future
  return completer.future;
}
