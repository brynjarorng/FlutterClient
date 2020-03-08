import 'dart:io';
import 'dart:async';
import 'dart:convert';

class LightController {
  Socket socket;

  // This NEEDS to have been called before using the class, net to learn how to do this correctly
  connect({ip = '192.168.1.24'}) async {
    // Check if socket objec is null before trying to connect
    if (socket != null) {
      disconnect();
    }

    socket = await Socket.connect(ip, 4000);
    print('Connected');
  }

  // This NEEDS to be called when exiting, close the socket connection
  disconnect() {
    // check if there is a connection before calling close
    if (socket != null) {
      socket.close();
    }
  }

  // Send command to client
  sendCommand(command) async {
    // do nothing if not conencted
    if (socket == null) {
      return;
    }

    // send hello
    socket.add(utf8.encode(command));

    // wait 5 seconds
    await Future.delayed(Duration(seconds: 5));
  }
}