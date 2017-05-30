//
//  main.swift
//  InheritanceLesson
//
//  Created by Wellington Moreno on 8/25/16.
//  Copyright © 2016 General Assembly. All rights reserved.
//

import Foundation


//=======================================
//  CLASSES
//=======================================


//1. Show how to make one class extend another
//2. Create the proper inheritance heirarchy



class Vehicle {

    // properties

    // methods
    func accelerate() {
        print("Speeding up.")
    }
    func brake() {
        print("Hit the brakes.")
    }
    func honk() {
        print("BeepBeep!")
    }

    // init
}

protocol blowHornMuffler {
    func blowHorn(blowHornNoise: String)
}

// extension SomeType {}

class Car: Vehicle {

}

extension Car: blowHornMuffler {
    func blowHorn(blowHornNoise: String) {
        print("blowhorn")
    }
}

class Truck: Car {

    
}

class Sedan: Car {
=======
    
    // property
    var quattro: Bool
    
    // method
    func hornHonking(honkNoise: String) -> String {
        return "\(honkNoise) is the vehicle's distinct honking nosie"
    }
    
    // initializer
    init() {
        quattro = true
    }
    
}

class Car : Vehicle {
    
    override func hornHonking(honkNoise: String) -> String {
        return "We are overriding this function to print \(honkNoise)"
    }
    
}

var civic = Car()

print(civic.hornHonking(honkNoise: "eeek, eeek"))


class Truck {
    
}


class Sedan {
    
}

class Coupe: Car {
    
}

class Ferrari: SportsCar {
    
}

class SUV: Car {
    
}

class SportsCar: Car {
    
}

class SemiTruck: Truck {
    
}

let vehicle = Vehicle()
let car = Car()
let sedan = Sedan()
let truck = Truck()
let semi = SemiTruck()



//3. Show how to check their types.

//=======================================
//  OVERRIDING FUNCTIONS
//=======================================

