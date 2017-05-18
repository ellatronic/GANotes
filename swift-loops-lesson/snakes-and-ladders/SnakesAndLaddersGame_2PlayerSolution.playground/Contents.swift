//: Playground - noun: a place where people can play

import Foundation

extension Int {
  static var random: Int { return Int(arc4random_uniform(UInt32(6))) + 1 }
}

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 1

var playerOne = 0
var playerTwo = 0

while playerOne < finalSquare && playerTwo < finalSquare {
  // roll the dice
  diceRoll = Int.random
  // move player 1 the rolled amount
  playerOne += diceRoll

  // roll the dice again
  diceRoll = Int.random
  // move player 2 the rolled amount
  playerTwo += diceRoll

  // Determine movement depending on snake or the ladder
  if playerOne < board.count {
    playerOne += board[playerOne]
  }
  if playerTwo < board.count {
    playerTwo += board[playerTwo]
  }
}

print("Game Over!")
if playerOne > playerTwo {
  print("Player 1 wins!")
} else if playerTwo > playerOne {
  print("Player 2 wins!")
} else {
  print("Tie!")
}
