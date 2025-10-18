// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeportedMigrantReturnEligibilityCodex {
    address public admin;

    struct ReturnEntry {
        string migrantName;
        string previousVisaType;
        string emotionalTag;
        bool summoned;
        bool eligible;
    }

    ReturnEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReturn(string memory migrantName, string memory previousVisaType, string memory emotionalTag) external onlyAdmin {
        entries.push(ReturnEntry(migrantName, previousVisaType, emotionalTag, true, false));
    }

    function markEligible(uint256 index) external onlyAdmin {
        entries[index].eligible = true;
    }

    function getReturnEntry(uint256 index) external view returns (ReturnEntry memory) {
        return entries[index];
    }
}
