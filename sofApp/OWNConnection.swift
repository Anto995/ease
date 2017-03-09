//
//  File.swift
//  BasicBlueSocket
//
//  Created by Arturo Ingenito on 02/03/17.
//
//

import Foundation
import Socket




class OWNConnection {
    let ack="*#*1##"
    let nack="*#*0##"
    
    var ip: String
    var port: Int32
    
    init(ip:String,port:Int32){
        self.ip=ip
        self.port=port
    }
    
    //REQUEST
    func getRequestLights(environment: String = "0",id: String = "0") -> [DeviceLight] {
        var environment_Id:String
        if id=="0" {
           environment_Id=environment
        }else{
            environment_Id=environment+id
        }
        let request = "*#\(WHO.Lights.rawValue)*\(environment_Id)##"
        var devices=[DeviceLight]()
        var socket: Socket
        var data: Data = Data()
        do {
            socket = try Socket.create()
            try socket.connect(to: ip, port: port)

            //inizialization
            var result = try socket.read(into: &data)
            var response = String(data: data, encoding: String.Encoding.utf8)

            try socket.write(from: "*99*0##")
            data.removeAll()
            result = try socket.read(into: &data)
            response = String(data: data, encoding: String.Encoding.utf8)

            //end inizialization
            
            try socket.write(from: request)
            
            repeat {
                data.removeAll()
                result = try socket.read(into: &data)
                response = String(data: data, encoding: String.Encoding.utf8)
                //print(response ?? "No Response Data")
                
                var responses=response?.components(separatedBy: "##")
                responses=responses?.filter({ $0 != ""}) //togliamo il vuoto
                for rr in responses! {
                    let rIesim=rr+"##"
                    if (rIesim != ack && rIesim != nack){
                        devices.append(parseStringLight(message: rIesim)!)
                    }
                }
            } while (!response!.contains(ack) && !response!.contains(nack))

            socket.close()
            
            
        } catch {
            print("ruh-roh")
        }
        return devices
        
    }
    
    func getRequestAutomation(id: String = "0") -> [DeviceAutomation] {
        
        let request = "*#\(WHO.Automation.rawValue)*\(id)##"
        
        var devices=[DeviceAutomation]()
        var socket: Socket
        
        var data: Data = Data()
        do {
            socket = try Socket.create()
            try socket.connect(to: ip, port: port)
            //inizialization
            var result = try socket.read(into: &data)
            var response = String(data: data, encoding: String.Encoding.utf8)
            
            try socket.write(from: "*99*0##")
            data.removeAll()
            result = try socket.read(into: &data)
            response = String(data: data, encoding: String.Encoding.utf8)
            
            //end inizialization
            
            try socket.write(from: request)
            
            repeat {
                data.removeAll()
                result = try socket.read(into: &data)
                response = String(data: data, encoding: String.Encoding.utf8)
                var responses=response?.components(separatedBy: "##")
                responses=responses?.filter({ $0 != ""}) //togliamo il vuoto
                for rr in responses! {
                    let rIesim=rr+"##"
                    if (rIesim != ack && rIesim != nack){
                        devices.append(parseStringAutomation(message: rIesim)!)
                    }
                }
            } while (!response!.contains(ack) && !response!.contains(nack))
        
            socket.close()
            
        } catch {
            print("ruh-roh")
        }
        return devices
        
    }
    
    func getRequestTemperature(id: String ) -> DeviceThermoregulation? {
        
        let request = "*#\(WHO.Thermoregulation.rawValue)*\(id)##"
        
        var device:DeviceThermoregulation?
        var socket: Socket
        
        var data: Data = Data()
        do {
            socket = try Socket.create()
            try socket.connect(to: ip, port: port)
            //inizialization
            var result = try socket.read(into: &data)
            var response = String(data: data, encoding: String.Encoding.utf8)
            
            try socket.write(from: "*99*0##")
            data.removeAll()
            result = try socket.read(into: &data)
            response = String(data: data, encoding: String.Encoding.utf8)
            
            //end inizialization
            
            try socket.write(from: request)
            
            var actualTemperature:String="0"
            var settedTemperature:String="0"
            repeat {
                data.removeAll()
                result = try socket.read(into: &data)
                response = String(data: data, encoding: String.Encoding.utf8)
               // print(response ?? "No Response Data")
                if((response != ack) && (response != nack)){
                    let message = response!.replacingOccurrences(of: "##", with: "") //togliamo i separatori
                    var fields=message.components(separatedBy: "*")
                    fields=fields.filter({ $0 != ""})
                    if(fields[2]=="0"){
                        actualTemperature=fields[3]
                    }
                    if(fields[2]=="12"){
                        settedTemperature=fields[3]
                    }
                }
                
            } while ((response != ack) && (response != nack))
            
       device=DeviceThermoregulation(id: id, actualTemperature: actualTemperature, settedTemperature: settedTemperature)
            socket.close()
            
        } catch {
            print("ruh-roh")
        }
        return device
        
    }
    
    //SEND
    func sendCommandLights(status: DeviceLight.STATUS,environment: String = "0",id: String = "0") -> Bool {
        var environment_Id:String
        if id=="0" {
            environment_Id=environment
        }else{
            environment_Id=environment+id
        }
        return sendCommand(type: WHO.Lights.rawValue,status: status.rawValue, id: environment_Id)
        
    }
    
    func sendCommandAutomation(status: DeviceAutomation.STATUS,id: String) -> Bool {
        return sendCommand(type: WHO.Automation.rawValue,status: status.rawValue, id: id)
        
    }
    
    private func sendCommand(type:String, status: String, id: String = "0") -> Bool {
        let request = "*\(type)*\(status)*\(id)##"
      //  print(request)
        var socket: Socket
        
        var data: Data = Data()
        do {
            
            
            socket = try Socket.create()
            try socket.connect(to: ip, port: port)
            
            //inizialization
            var result = try socket.read(into: &data)
            var response = String(data: data, encoding: String.Encoding.utf8)
            try socket.write(from: "*99*0##")
            data.removeAll()
            result = try socket.read(into: &data)
            response = String(data: data, encoding: String.Encoding.utf8)
            //end inizialization
            
            try socket.write(from: request)
            result = try socket.read(into: &data)
            response = String(data: data, encoding: String.Encoding.utf8)
            
            var messages = response!.components(separatedBy: "##")
            messages=messages.filter({ $0 != ""}) //rimuoviamo i caratteri soli ""
            for  m in messages{
                if(m=="*#*0"){//NACK
                    return false
                }
            }
            
         //  print("CLIENT: \(request)")
         //  print("SERVER: \(response!)")
            socket.close()

            
        } catch {
            print("ruh-roh")
        }
        return true
    }
    
    func sendCommandTemperature(id: String, temperature: String) -> Bool {
        let request = "*#\(WHO.Thermoregulation.rawValue)*\(id)*#14*\(temperature)*3##"
//print(request)
        var socket: Socket
        
        var data: Data = Data()
        do {
            
            
            socket = try Socket.create()
            try socket.connect(to: ip, port: port)
            
            //inizialization
            var result = try socket.read(into: &data)
            var response = String(data: data, encoding: String.Encoding.utf8)
            try socket.write(from: "*99*0##")
            data.removeAll()
            result = try socket.read(into: &data)
            response = String(data: data, encoding: String.Encoding.utf8)
            //end inizialization
            
            try socket.write(from: request)
            result = try socket.read(into: &data)
            response = String(data: data, encoding: String.Encoding.utf8)
            
            var messages = response!.components(separatedBy: "##")
            messages=messages.filter({ $0 != ""}) //rimuoviamo i caratteri soli ""
            for  m in messages{
                if(m=="*#*0"){//NACK
                    return false
                }
            }
            
            //  print("CLIENT: \(request)")
            //  print("SERVER: \(response!)")
            socket.close()
            
            
        } catch {
            print("ruh-roh")
        }
        return true
    }

    
    
   private func parseStringLight(message:String)->DeviceLight?{
    var device:DeviceLight?
    let message = message.replacingOccurrences(of: "##", with: "") //togliamo i separatori

    var fields=message.components(separatedBy: "*")
    fields=fields.filter({ $0 != ""}) //rimuoviamo i caratteri soli ""
    if fields.count == 3 { //nel dubbio:
        var environment=fields[2].substring(to: fields[2].index(fields[2].startIndex, offsetBy: 1))
        var id=fields[2].substring(from: fields[2].index(fields[2].startIndex, offsetBy: 1))
        
        device=DeviceLight(status:  DeviceLight.STATUS(rawValue: fields[1])!,environment:environment,id:id)
    }
        return device
    

    }
   private func parseStringAutomation(message:String)->DeviceAutomation?{
    let message = message.replacingOccurrences(of: "##", with: "") //togliamo i separatori
    var fields=message.components(separatedBy: "*")

    fields=fields.filter({ $0 != ""})
       return DeviceAutomation(status:DeviceAutomation.STATUS(rawValue: fields[1])!,id:fields[2])
    
    
    }
}


    
    
    
    



