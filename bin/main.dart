import 'dart:async';
import 'dart:convert';
import 'dart:io';

main(List<String> args) {

  initProcess();

}

initProcess() async {

  Process simpleConsole = await Process.start('java', ['-jar', 'bin/simple_console.jar']);

  simpleConsole.stdout
      .transform(UTF8.decoder)
      .listen((data) {
    print(data);
  });

  simulateOperation(simpleConsole);

  return simpleConsole;
}

void simulateOperation(Process process) {
  new Future.delayed(new Duration(seconds: 2), (){
    process.stdin.writeln("sing");
  });

  new Future.delayed(new Duration(seconds: 4), (){
    process.stdin.writeln("echo");
  });

  new Future.delayed(new Duration(seconds: 5), (){
    process.stdin.writeln("test test");
  });

  new Future.delayed(new Duration(seconds: 6), (){
    killProcess(process);
  });

}


killProcess(Process process) async {
  process.kill();
}