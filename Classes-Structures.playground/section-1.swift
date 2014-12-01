// Playground - noun: a place where people can play 

import UIKit

class Vehicle {
    var wheelNumber: Int
    var passengerNumber: Int
    
    func description() -> String {
        return "\(wheelNumber) wheels and \(passengerNumber) max number of passengers"
    }
    
    init() {
        wheelNumber = 0
        passengerNumber = 0
    }
    
}



class Bycicle: Vehicle {
    
    override init() {
        super.init()
        wheelNumber = 2
        passengerNumber = 2
    }
    
}

let abycicle = Bycicle()
abycicle.description()

struct​ Resolution​ {
    ​    ​var​ width​ = ​0
    ​    ​var​ height​ = ​0
    ​}
​class​ VideoMode​ {
    ​    ​var​ resolution​ = ​Resolution​()
    ​    ​var​ interlaced​ = ​false
    ​    ​var​ frameRate​ = ​0.0
    ​    ​var​ name​: ​String​?
    ​}


