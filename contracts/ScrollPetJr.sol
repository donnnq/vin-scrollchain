// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollPetJr {
    struct Pet {
        string name;
        uint256 happiness;
        uint256 hunger;
        uint256 level;
        uint256 lastInteraction;
    }

    mapping(address => Pet) public pets;

    function feedPet() external {
        Pet storage p = pets[msg.sender];
        p.hunger = 0;
        p.lastInteraction = block.timestamp;
    }

    function playWithPet() external {
        Pet storage p = pets[msg.sender];
        p.happiness += 10;
        p.lastInteraction = block.timestamp;
        if (p.happiness > 100) p.level++;
    }
}
