//: Playground - noun: a place where people can play

import Cocoa

class CoffeeMachine {
    
    let tankOfWater: TankOfWater
    let pot: Pot
    
    
    func turnOn() {
        tankOfWater.heat()
    }
    
    func fillWithWater(water: Water) {
        tankOfWater.fillWithWater(water: water)
        tankOfWater.heat()
        let hotWater = tankOfWater.getHotWater()
        pot.put(hotWater)
    }
    
    
}



class Pot {
    var water: Water? = nil
    
    func put(water: Water) {
        self.water = water
    }
    
    
}

class TankOfWater {
    
    var water: Water? = nil
    
    func fillWithWater(water: Water) {
        self.water =  water
    }
    
    func heat() {
        print("I'm heating")
    }
    
    func getHotWater() -> Water {
        return self.water!
    }
}

class Water {
    
}

class Cup {
    var water: Water?
}