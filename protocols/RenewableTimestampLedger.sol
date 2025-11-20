// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RenewableTimestampLedger {
    address public validator;

    struct Renewable {
        string typeOfEnergy;
        string upgrade;
        string ecoTag;
        uint256 timestamp;
    }

    Renewable[] public renewables;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logRenewable(string memory _type, string memory _upgrade, string memory _tag) public onlyValidator {
        renewables.push(Renewable(_type, _upgrade, _tag, block.timestamp));
    }

    function getRenewable(uint256 index) public view returns (Renewable memory) {
        return renewables[index];
    }

    function totalRenewables() public view returns (uint256) {
        return renewables.length;
    }
}
