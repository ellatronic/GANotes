//: Playground - noun: a place where people can play

import Foundation

extension Int {
  static var random: Int { return Int(arc4random_uniform(UInt32(6))) + 1 }
}

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

