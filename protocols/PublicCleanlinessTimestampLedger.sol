// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PublicCleanlinessTimestampLedger {
    address public validator;

    struct Cleanliness {
        string location;
        string feature;
        string cleanlinessTag;
        uint256 timestamp;
    }

    Cleanliness[] public entries;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logCleanliness(string memory _location, string memory _feature, string memory _tag) public onlyValidator {
        entries.push(Cleanliness(_location, _feature, _tag, block.timestamp));
    }

    function getCleanliness(uint256 index) public view returns (Cleanliness memory) {
        return entries[index];
    }

    function totalEntries() public view returns (uint256) {
        return entries.length;
    }
}
