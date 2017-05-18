//: Playground - noun: a place where people can play

import Foundation

extension Int {
  static var random: Int { return Int(arc4random_uniform(UInt32(6))) + 1 }
}

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

// Every player starts at 0
var square = 0
// This variable stores the Dice Roll for that current turn
var diceRoll = 1

while square < finalSquare {
  // roll the dice
  diceRoll = Int.random
  
  // Move the rolled amount
  square += diceRoll
  
  // If we're still on the board move up or down the ladder or snake
  if square < board.count {
    square += board[square]
  }
}

print("Game Over!")