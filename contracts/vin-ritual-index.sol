// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract VinRitualIndex is Ownable {
    struct Ritual {
        string name;
        address contractAddress;
        string description;
        uint256 timestamp;
    }

    Ritual[] public rituals;

    event RitualAdded(string name, address contractAddress, string description, uint256 indexed index);

    function addRitual(
        string calldata name,
        address contractAddress,
        string calldata description
    ) external onlyOwner {
        rituals.push(Ritual({
            name: name,
            contractAddress: contractAddress,
            description: description,
            timestamp: block.timestamp
        }));

        emit RitualAdded(name, contractAddress, description, rituals.length - 1);
    }

    function totalRituals() external view returns (uint256) {
        return rituals.length;
    }

    function getRitual(uint256 index) external view returns (Ritual memory) {
        require(index < rituals.length, "Invalid index");
        return rituals[index];
    }
}
