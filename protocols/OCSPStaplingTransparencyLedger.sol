// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract OCSPStaplingTransparencyLedger {
    address public validator;

    struct Stapling {
        string bank;
        bool enabled;
        string note;
        uint256 timestamp;
    }

    Stapling[] public staplings;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logStapling(string memory _bank, bool _enabled, string memory _note) public onlyValidator {
        staplings.push(Stapling(_bank, _enabled, _note, block.timestamp));
    }

    function getStapling(uint256 index) public view returns (Stapling memory) {
        return staplings[index];
    }

    function totalStaplings() public view returns (uint256) {
        return staplings.length;
    }
}
