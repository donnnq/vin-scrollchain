// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BankingTLSUpgradeDAO {
    address public validator;

    struct Upgrade {
        string bank;
        string protocol;
        bool enforced;
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

    function enforceUpgrade(string memory _bank, string memory _protocol) public onlyValidator {
        upgrades.push(Upgrade(_bank, _protocol, true, block.timestamp));
    }

    function getUpgrade(uint256 index) public view returns (Upgrade memory) {
        return upgrades[index];
    }

    function totalUpgrades() public view returns (uint256) {
        return upgrades.length;
    }
}
