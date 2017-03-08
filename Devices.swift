//
//  Devices.swift
//  BasicBlueSocket
//
//  Created by Arturo Ingenito on 02/03/17.
//
//

import Foundation
import UIKit
enum WHO: String{
    case Lights="1"
    case Automation="2"
    case Thermoregulation="4"
}


class REQEUST{
    var who:WHO
    var where_:String
    var parameter:String
    var values:[String]
    init(who:WHO,where_:String,parameter:String, values:String){
        self.who=who
        self.where_=where_
        self.parameter=parameter
        self.values=[values]
    }
    
}

class DeviceLight : CustomStringConvertible{
    enum STATUS: String{
        case ON="1"
        case OFF="0"
        case VENTI="2"
        case TRENTA="3"
        case QUARANTA="4"
        case CINQUANTA="5"
        case SESSANTA="6"
        case SETTANTA="7"
        case OTTANTA="8"
        case NOVANTA="9"
        case CENTO="10"
    }
    var environment: String
    var id: String
    //var group: String
    var status:DeviceLight.STATUS
    var type:WHO=WHO.Lights
    var room: Room?
    let image: UIImage = #imageLiteral(resourceName: "light")
    
    var description: String {
        return "type: \(type), environment: \(environment), id: \(id), status:\(status)\n"
    }
    
    init(status:STATUS,environment:String,id:String){
        self.environment=environment
        self.id=id
        // self.group=group
        self.status=status
    }
    
}

class DeviceAutomation : CustomStringConvertible{
    enum STATUS: String{
        case UP="1"
        case DOWN="2"
        case STOP="0"
    }
    var id: String
    var status:DeviceAutomation.STATUS
    var type:WHO=WHO.Automation
    
    var description: String {
        return "type: \(type) id: \(id), status:\(status)\n"
    }
    
    init(status:STATUS,id:String){
        self.id=id
        // self.group=group
        self.status=status
    }
    
}

class DeviceThermoregulation : CustomStringConvertible{

    var id: String
    var actualTemperature:String
    var settedTemperature:String

    var type:WHO=WHO.Thermoregulation
    
    var description: String {
        return "type: \(type) id: \(id), actualTemperature:\(actualTemperature)\n, settedTemperature:\(settedTemperature)\n"
    }
    
    init(id:String,actualTemperature:String,settedTemperature:String){
        self.id=id
        self.actualTemperature=actualTemperature
        self.settedTemperature=settedTemperature
    }
    
}


