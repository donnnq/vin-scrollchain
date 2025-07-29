// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinDiplomaticScream {
    event SoulScreamed(uint256 indexed soulId, string cry);

    function recordScream(uint256 soulId, string memory cry) public {
        emit SoulScreamed(soulId, cry);
    }
}
