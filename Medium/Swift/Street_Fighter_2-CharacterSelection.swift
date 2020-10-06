// Short Intro
// Some of you might remember spending afternoons playing Street Fighter 2 in some Arcade back in the 90s or emulating it nowadays with the numerous emulators for retro consoles.
// Can you solve this kata? Suuure-You-Can!
// UPDATE: a new kata's harder version is available here.
// The Kata
// You'll have to simulate the video game's character selection screen behaviour, more specifically the selection grid. Such screen looks like this:
// Screen:
// screen
// Selection Grid Layout in text:
// | Ryu  | E.Honda | Blanka  | Guile   | Balrog | Vega    |
// | Ken  | Chun Li | Zangief | Dhalsim | Sagat  | M.Bison |
// Input

// the list of game characters in a 2x6 grid;
// the initial position of the selection cursor (top-left is (0,0));
// a list of moves of the selection cursor (which are up, down, left, right);
// Output

// the list of characters who have been hovered by the selection cursor after all the moves (ordered and with repetition, all the ones after a move, wether successful or not, see tests);
// Rules

// Selection cursor is circular horizontally but not vertically!

// As you might remember from the game, the selection cursor rotates horizontally but not vertically; that means that if I'm in the leftmost and I try to go left again I'll get to the rightmost (examples: from Ryu to Vega, from Ken to M.Bison) and vice versa from rightmost to leftmost.

// Instead, if I try to go further up from the upmost or further down from the downmost, I'll just stay where I am located (examples: you can't go lower than lowest row: Ken, Chun Li, Zangief, Dhalsim, Sagat and M.Bison in the above image; you can't go upper than highest row: Ryu, E.Honda, Blanka, Guile, Balrog and Vega in the above image).

// Test

// For this easy version the fighters grid layout and the initial position will always be the same in all tests, only the list of moves change.

// Notice: changing some of the input data might not help you.

// Examples

// 1.

// fighters = [
//     ["Ryu", "E.Honda", "Blanka", "Guile", "Balrog", "Vega"],
//     ["Ken", "Chun Li", "Zangief", "Dhalsim", "Sagat", "M.Bison"]
// ]
// initial_position = (0,0)
// moves = ['up', 'left', 'right', 'left', 'left']
// then I should get:

// ['Ryu', 'Vega', 'Ryu', 'Vega', 'Balrog']
// as the characters I've been hovering with the selection cursor during my moves. Notice: Ryu is the first just because it "fails" the first up See test cases for more examples.

// 2.

// fighters = [
//     ["Ryu", "E.Honda", "Blanka", "Guile", "Balrog", "Vega"],
//     ["Ken", "Chun Li", "Zangief", "Dhalsim", "Sagat", "M.Bison"]
// ]
// initial_position = (0,0)
// moves = ['right', 'down', 'left', 'left', 'left', 'left', 'right']
// Result:

// ['E.Honda', 'Chun Li', 'Ken', 'M.Bison', 'Sagat', 'Dhalsim', 'Sagat']
// OFF-TOPIC

// Some music to get in the mood for this kata :

//LINK : https://www.codewars.com/kata/5853213063adbd1b9b0000be/train/swift

import UIKit

enum Direction {
    case up
    case left
    case right
    case down
}

func streetFighterSelection(fighters: [[String]], position: (row: Int, column: Int), moves: [Direction]) -> [String] {

    var linha = 0
    var coluna = 0
    var result : [String] = []
    
    for i in moves{
        switch i {
        case .up:
            linha -= 1
        case .down:
            linha += 1
        case .left:
            coluna -= 1
        case .right:
            coluna += 1
        }
        if(linha < 0){
            linha = 0
        }
        if(linha == fighters.count){
            linha -= 1
        }
        if(coluna == fighters[0].count){
            coluna = 0
        }
        if(coluna == -1){
            coluna = fighters[0].count - 1
        }
        
        result.append(fighters[linha][coluna])
    }
    
  return result
}

let fig = [
        //COLUNA    0        1           2          3        4       5
    /* LINHA 0*/  ["Ryu", "E.Honda",  "Blanka",   "Guile", "Balrog", "Vega"],
    /* LINHA 1*/  ["Ken", "Chun Li", "Zangief", "Dhalsim",  "Sagat", "M.Bison"]
]

streetFighterSelection(fighters: fig, position: (0,0), moves: [.up, .up, .up, .up])



//BEST PRACTICES

// let width = fighters.first?.count ?? 0, height = fighters.count
//     var position = position
    
//     return moves.map { move in
//         switch move {
//         case .up: if position.row != 0 { position.row -= 1 }
//         case .down: if position.row != height - 1 { position.row += 1 }
//         case .left: position.column = (position.column + width - 1) % width
//         case .right: position.column = (position.column + 1) % width
//         }
        
//         return fighters[position.row][position.column]
//     }
