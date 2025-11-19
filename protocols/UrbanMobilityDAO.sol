// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract UrbanMobilityDAO {
    address public validator;

    struct MobilityUpgrade {
        string location;
        string upgradeType;
        string feature;
        string auditTag;
        uint256 timestamp;
    }

    MobilityUpgrade[] public upgrades;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logUpgrade(string memory _location, string memory _type, string memory _feature, string memory _tag) public onlyValidator {
        upgrades.push(MobilityUpgrade(_location, _type, _feature, _tag, block.timestamp));
    }

    function getUpgrade(uint256 index) public view returns (MobilityUpgrade memory) {
        return upgrades[index];
    }

    function totalUpgrades() public view returns (uint256) {
        return upgrades.length;
    }
}
