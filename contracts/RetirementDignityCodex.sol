// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RetirementDignityCodex {
    address public admin;

    struct RetirementEntry {
        string workerName;
        string sector;
        uint retirementAge;
        string emotionalTag;
        bool honored;
        bool archived;
    }

    RetirementEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logRetirement(string memory workerName, string memory sector, uint retirementAge, string memory emotionalTag) external onlyAdmin {
        entries.push(RetirementEntry(workerName, sector, retirementAge, emotionalTag, true, false));
    }

    function archiveRetirement(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getRetirement(uint256 index) external view returns (RetirementEntry memory) {
        return entries[index];
    }
}
