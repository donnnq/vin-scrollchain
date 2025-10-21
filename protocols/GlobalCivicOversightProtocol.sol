// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalCivicOversightProtocol {
    address public admin;

    struct OversightEntry {
        string region;
        string oversightType; // "Legislative Monitoring", "Committee Transparency", "Citizen Audit Inclusion"
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    OversightEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOversight(string memory region, string memory oversightType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(OversightEntry(region, oversightType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealOversightEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
