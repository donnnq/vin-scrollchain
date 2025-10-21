// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreelanceInsuranceCodex {
    address public admin;

    struct InsuranceEntry {
        string platformName;
        string coverageType;
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    InsuranceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonInsurance(string memory platformName, string memory coverageType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(InsuranceEntry(platformName, coverageType, codexClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealInsuranceEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getInsuranceEntry(uint256 index) external view returns (InsuranceEntry memory) {
        return entries[index];
    }
}
