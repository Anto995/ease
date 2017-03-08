//
//
//import Foundation
//import Socket
//
//
////192.168.1.35
//print("I want a socket")
//var socket: Socket
////let webRequest = "*1*1*15##"
//let webRequest = "*#1*0##"
//
//
//
////*1*1*15##"
///*
//var responseData = ""
//var data: Data = Data()
//do {
//    socket = try Socket.create()
//    try socket.connect(to: "192.168.1.35", port: 20000)
//   
//    //inizialization
//    var result = try socket.read(into: &data)
//    var response = String(data: data, encoding: String.Encoding.utf8)
//    try socket.write(from: "*99*0##")
//    data.removeAll()
//    result = try socket.read(into: &data)
//    response = String(data: data, encoding: String.Encoding.utf8)
//    //end inizialization
//    
//    try socket.write(from: webRequest)
//    
//    repeat {
//        data.removeAll()
//        result = try socket.read(into: &data)
//        response = String(data: data, encoding: String.Encoding.utf8)
//        print(response ?? "No Response Data")
//    } while((response != ack) || (response == nack))
//    
//socket.close()
//} catch {
//    print("ruh-roh")
//}
//
//*/
//
//
//
//////////////////////////////
//
//var con=OWNConnection(ip: "192.168.1.35", port: 20000)
//
////LUCI
//var devices=[DeviceLight]()
//devices=con.getRequestLights()
//print(devices)
//devices=con.getRequestLights(environment:"1")
//print(devices)
//devices=con.getRequestLights(environment:"1",id:"1")
//print(devices)
//
//print(con.sendCommandLights(status: DeviceLight.STATUS.OFF))
//
//print(con.sendCommandLights(status: DeviceLight.STATUS.OFF,environment: "1"))
//print(con.sendCommandLights(status: DeviceLight.STATUS.OFF, environment: "1",id: "1"))
//
//
//
//print(con.sendCommandLights(status: DeviceLight.STATUS.ON, environment: "1"))
//devices=con.getRequestLights(environment:"1",id:"1")
//print(devices)
//
////////// AUTOMAZIONE
// 
//var devicesAutomation=[DeviceAutomation]()
//
//
//devicesAutomation=con.getRequestAutomation()
//print(devicesAutomation)
//
//print(con.sendCommandAutomation(status: DeviceAutomation.STATUS.UP,id:"31"))
//print(con.sendCommandAutomation(status: DeviceAutomation.STATUS.STOP,id:"31"))
//
//print(con.getRequestAutomation())
//
////TERMOMETRO
//print(con.getRequestTemperature(id: "1")!)
//print(con.sendCommandTemperature(id: "1", temperature: "0310"))
//
//
//
//
//
//
////var devices=con.parseString(message: "*#*1##*1*1*11##*1*1*12##*1*1*21##*1*1*22##*1*1*23##*1*1*23##")
