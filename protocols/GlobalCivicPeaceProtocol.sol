// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalCivicPeaceProtocol {
    address public admin;

    struct PeaceEntry {
        string city;
        string peaceType; // "Vendor Harmony", "Lighting Balance", "Park Serenity"
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    PeaceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPeace(string memory city, string memory peaceType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(PeaceEntry(city, peaceType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealPeaceEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getPeaceEntry(uint256 index) external view returns (PeaceEntry memory) {
        return entries[index];
    }
}
