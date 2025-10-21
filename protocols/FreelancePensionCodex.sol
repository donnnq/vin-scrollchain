// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreelancePensionCodex {
    address public admin;

    struct PensionEntry {
        string platformName;
        string pensionModel;
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    PensionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPension(string memory platformName, string memory pensionModel, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(PensionEntry(platformName, pensionModel, codexClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealPensionEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getPensionEntry(uint256 index) external view returns (PensionEntry memory) {
        return entries[index];
    }
}
