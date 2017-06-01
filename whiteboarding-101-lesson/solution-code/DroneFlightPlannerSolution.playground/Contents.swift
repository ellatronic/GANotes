//: Playground - noun: a place where people can play

import UIKit

struct Point3D {
  let x: Int
  let y: Int
  let z: Int
}

let points = [Point3D(x:0, y:2, z:10), Point3D(x:3, y:5, z:0), Point3D(x:9, y:20, z:6), Point3D(x:10, y:12, z:15), Point3D(x:10, y:10, z:8)]


func calculateFuelBasic(from points: [Point3D]) -> Int {
  var litersAdded = 0
  var energyBalance = 0
  
  for i in 1..<points.count {
    energyBalance += points[i-1].z - points[i].z
    if energyBalance < 0 {
      litersAdded -= energyBalance
      energyBalance = 0
    }
  }
  
  return litersAdded
}

func calculateFuelSimple(from points: [Point3D]) -> Int {
  guard let initialHeight = points.first?.z else { return 0 }
  var maxHeight = initialHeight
  
  for point in points {
    maxHeight = max(point.z, maxHeight)
  }
  
  return maxHeight - initialHeight
}

calculateFuelBasic(from: points)
calculateFuelSimple(from: points)