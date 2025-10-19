// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommuterSafetyImmunityDAO {
    address public admin;

    struct SafetyEntry {
        string location;
        string riskType;
        string immunityType;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    SafetyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSafety(string memory location, string memory riskType, string memory immunityType, string memory emotionalTag) external onlyAdmin {
        entries.push(SafetyEntry(location, riskType, immunityType, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealSafety(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getSafetyEntry(uint256 index) external view returns (SafetyEntry memory) {
        return entries[index];
    }
}
