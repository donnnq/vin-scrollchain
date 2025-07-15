// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollDragonCity {
    // Placeholder structure
    struct Dragon {
        string name;
        string element;
        uint256 power;
        uint256 health;
        uint256 lastFed;
    }

    Dragon[] public dragons;
    mapping(address => uint256[]) public ownerToDragons;

    function summonDragon(string calldata name, string calldata element) external {
        dragons.push(Dragon(name, element, 100, 100, block.timestamp));
        ownerToDragons[msg.sender].push(dragons.length - 1);
    }
}
