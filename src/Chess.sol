// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Chess {
    /*//////////////////////////////////////////////////////////////
                             CONSTANTS
    //////////////////////////////////////////////////////////////*/

    /// @notice this is a valid move
    uint256 constant validSquare = 0x00;

    /// @notice This is an invalid move
    uint256 constant invalidSqaures = 0x01;

    /// @notice The address which receives gobble
    uint256[64] internal board;

    //start a challenge
    function challenge(address player2, uint256 _wager) external {
        assembly{
            call(gas(), _wager,  player2, _wager)
        }
    }

    function deposit() external payable {

    }

    function withdraw() external payable {}
}
