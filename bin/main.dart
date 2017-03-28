import 'dart:async';
import 'dart:convert';
import 'dart:io';

main(List<String> args) {
  initProcess();
}

initProcess() async {

  // 因為需要持續與這個 JAR 互動，所以用 Process.start 啟動

  Process simpleConsole = await Process.start('java', ['-jar', 'bin/simple_console.jar']);

  // 監聽輸出

  simpleConsole.stdout
      .transform(UTF8.decoder)
      .listen((data) {
    print(data);
  });

  // 設置完畢，開始模擬

  simulateOperation(simpleConsole);
}

void simulateOperation(Process process) {

  // 2秒後模擬 user 輸入 "sing"

  new Future.delayed(new Duration(seconds: 2), (){
    process.stdin.writeln("sing");
  });

  // 4秒後模擬 user 輸入 "echo"

  new Future.delayed(new Duration(seconds: 4), (){
    process.stdin.writeln("echo");
  });

  // 5秒後模擬 user 輸入任意文字

  new Future.delayed(new Duration(seconds: 5), (){
    process.stdin.writeln("test test");
  });

  // 6秒後模擬結束，刪除process

  new Future.delayed(new Duration(seconds: 6), (){
    killProcess(process);
  });
}


killProcess(Process process) async {
  process.kill();
}