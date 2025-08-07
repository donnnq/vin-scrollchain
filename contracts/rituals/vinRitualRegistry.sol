// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Ritual Registry
/// @notice Master index of Vinvin's ritual contracts
contract vinRitualRegistry {
    address public creator;
    string public registryName = "Vinvin's Ritual Registry";

    struct Ritual {
        string name;
        string description;
        address contractAddress;
        uint registeredAt;
    }

    Ritual[] public rituals;

    event RitualRegistered(string name, address indexed contractAddress);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can register rituals");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function registerRitual(string memory _name, string memory _description, address _contractAddress) public onlyCreator {
        rituals.push(Ritual(_name, _description, _contractAddress, block.timestamp));
        emit RitualRegistered(_name, _contractAddress);
    }

    function getAllRituals() public view returns (Ritual[] memory) {
        return rituals;
    }
}
