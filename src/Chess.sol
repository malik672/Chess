// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Error} from "./errors.sol";

contract Chess is Error{
    /*//////////////////////////////////////////////////////////////
                             STATE VARIABLES
    //////////////////////////////////////////////////////////////*/

    /// @notice this is a valid move
    uint256 constant validSquare = 0x00;

    /// @notice This is an invalid move
    uint256 constant invalidSqaures = 0x01;

    /// @notice this represents the first half of the board(white Pieces)
    uint256 public constant board1 = 0x121314111014131215151515151515150000000000000000;

    ///@notice this represents the second half of the board
    uint256 public constant board2 = 0x000000000000000015151515151515151213141110141312;

    uint8 constant king = 0x10;
    uint8 constant queen = 0x11;
    uint8 constant rook = 0x12;
    uint8 constant knight = 0x13;
    uint8 constant bishop = 0x14;
    uint8 constant pawns = 0x15;


    /// @notice struct of individual chess game
    struct Game {
        address player1;
        address player2;
        address winner;
        /// @notice current player turn to move
        address current;
        uint wager;
    }

   struct challenge {
     address challenger;
     bool isChallengeAccepted;
     uint wager;
   }

    Game[] public Games; 
    challenge[] public Challenges;


    /*//////////////////////////////////////////////////////////////
                             MAPPINGS
    //////////////////////////////////////////////////////////////*/

    /// @notice this mapping checks whether a gameId is valid
    mapping(uint256 => bool) public isGameValid;

    /// @notice this mapping checks whether a challenge is valid using it index
    mapping(uint256 => bool) public isChallengeValid;



    /*//////////////////////////////////////////////////////////////
                             FUNCTIONS
    //////////////////////////////////////////////////////////////*/

     //start a challenge
    function challenge(address player2, uint256 _wager) external {
        //challenge initialized 
        Games.push(Game(msg.sender, player2, _wager));
        assembly{
            call(gas(), _wager,  player2, _wager)
        }
    }

    function move(uint gameId, uint8 piece, uint direction) external() {
      if(isGameValid[gameId] == true) inValidMove();
    }

    function deposit() external payable {

    }

    function withdraw() external payable {}
}
