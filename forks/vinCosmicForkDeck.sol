// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinCosmicForkDeck {
    struct Fork {
        string originNode;
        string newNode;
        string steward;
        string ritualBundle;
        string forkNote;
        uint256 timestamp;
    }

    Fork[] public forks;

    event RitualForked(string originNode, string newNode, string steward, string ritualBundle);

    function forkRitual(
        string memory originNode,
        string memory newNode,
        string memory steward,
        string memory ritualBundle,
        string memory forkNote
    ) public {
        forks.push(Fork(originNode, newNode, steward, ritualBundle, forkNote, block.timestamp));
        emit RitualForked(originNode, newNode, steward, ritualBundle);
    }

    function getForks() public view returns (Fork[] memory) {
        return forks;
    }
}
