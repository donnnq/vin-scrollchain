// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PublicTransportDignityDAO {
    address public validator;

    struct Upgrade {
        string terminal;
        string feature;
        string dignityTag;
        uint256 timestamp;
    }

    Upgrade[] public upgrades;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logUpgrade(string memory _terminal, string memory _feature, string memory _tag) public onlyValidator {
        upgrades.push(Upgrade(_terminal, _feature, _tag, block.timestamp));
    }

    function getUpgrade(uint256 index) public view returns (Upgrade memory) {
        return upgrades[index];
    }

    function totalUpgrades() public view returns (uint256) {
        return upgrades.length;
    }
}
