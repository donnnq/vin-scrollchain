// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreelanceRetirementCodex {
    address public admin;

    struct RetirementEntry {
        string platformName;
        string retirementModel;
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    RetirementEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRetirement(string memory platformName, string memory retirementModel, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RetirementEntry(platformName, retirementModel, codexClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealRetirementEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getRetirementEntry(uint256 index) external view returns (RetirementEntry memory) {
        return entries[index];
    }
}
