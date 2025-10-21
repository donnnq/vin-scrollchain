// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalCivicSafetyProtocol {
    address public admin;

    struct SafetyEntry {
        string city;
        string safetyType; // "Lighting", "Emergency Access", "Surveillance", "Public Signage"
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool activated;
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

    function summonSafety(string memory city, string memory safetyType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(SafetyEntry(city, safetyType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealSafetyEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getSafetyEntry(uint256 index) external view returns (SafetyEntry memory) {
        return entries[index];
    }
}
