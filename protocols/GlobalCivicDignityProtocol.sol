// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalCivicDignityProtocol {
    address public admin;

    struct DignityEntry {
        string city;
        string dignityType; // "Sanitation", "Accessibility", "Emergency Comfort"
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    DignityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDignity(string memory city, string memory dignityType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(DignityEntry(city, dignityType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealDignityEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getDignityEntry(uint256 index) external view returns (DignityEntry memory) {
        return entries[index];
    }
}
