# Chess Smart Contract
This is a Solidity smart contract for playing chess on the Ethereum blockchain.

## Overview
The contract allows two players to start a game by creating a challenge, which includes the amount of wager placed on the game. The challenged player can either accept or reject the challenge. Once the challenge is accepted, the game starts and each player takes turns to move their pieces. The game ends when a player's king is in a checkmate position, and the other player is declared the winner.

## State Variables
- `validSquare` represents a valid move on the chess board.
- `invalidSquares` represents an invalid move on the chess board.
- `board1` represents the first half of the chess board, with white pieces.
- `board2` represents the second half of the chess board, with black pieces.
- `king`, `queen`, `rook`, `knight`, `bishop`, and `pawns` represent the different types of chess pieces.
## Structs
- `Game` is a struct that represents an individual chess game. It contains the addresses of the two players, the current player's turn to move, and the amount of wager placed on the game.
- `Challenge` is a struct that represents a challenge. It contains the address of the challenger, the status of the challenge whether it has been accepted or not, and the amount of wager placed on the game.
## Mappings
- `isGameValid` is a mapping that checks whether a given gameId is valid.
- `isChallengeValid` is a mapping that checks whether a given challenge is valid.
## Functions
- `challenge` allows a player to start a challenge by passing in the address of the other player and the amount of wager placed on the game.
- `move` allows a player to move their piece during the game.
- `deposit` allows players to deposit funds into the contract.
- `withdraw` allows players to withdraw their funds from the contract.
## Error Handling
The Error contract contains an `inValidMove` error function that is used to indicate an invalid move during the game.

## License
This contract is released under the MIT License. You are free to use, modify, and distribute it for any purpose.
