// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./Errors.sol";
import "./Utils.sol";

contract Chess is Errors, Utils {
    Utils internal utils;

    constructor() {
        utils = new Utils();
    }


    /*//////////////////////////////////////////////////////////////
                             EVENTS
    //////////////////////////////////////////////////////////////*/
    event log_challenge(address indexed _challenger, address indexed _challenged, uint256 _wager);

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
        address current;
        uint256 wager;
    }

    struct challenge {
        address challenger;
        bool isChallengeAccepted;
        uint256 wager;
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


    // //start a challenge
    function startChallenge(address player2, uint256 _wager) external {
        //set challengeId to true, using the Challenges.length
        isChallengeValid[Challenges.length] = true;

        //challenge initialized
        Games.push(Game(msg.sender, player2, address(0), address(0), _wager));
        assembly {
            let success := call(gas(), _wager, player2, _wager, 0, 0, 0)
            if iszero(success) { revert(0, 0) }
        }
        emit log_challenge(utils.msgSender(), player2, _wager);
    }

    function move(uint256 gameId, uint8 piece, uint256 direction) view external {
        //checks if Game is valid
        if (isGameValid[gameId]) revert inValid();

        assembly {
            //    call(gas(), caller() 1, 0, 0 ,0,0)
        }
    }

    // function deposit() external payable {}

    // function withdraw() external payable {}
}
