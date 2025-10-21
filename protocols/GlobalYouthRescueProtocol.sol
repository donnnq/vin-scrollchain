// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalYouthRescueProtocol {
    address public admin;

    struct RescueEntry {
        string city;
        string rescueType; // "Street Intervention", "Truck Jumper Recovery", "Barangay Reintegration"
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool rescued;
        bool sealed;
    }

    RescueEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRescue(string memory city, string memory rescueType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RescueEntry(city, rescueType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmRescue(uint256 index) external onlyAdmin {
        entries[index].rescued = true;
    }

    function sealRescueEntry(uint256 index) external onlyAdmin {
        require(entries[index].rescued, "Must be rescued first");
        entries[index].sealed = true;
    }

    function getRescueEntry(uint256 index) external view returns (RescueEntry memory) {
        return entries[index];
    }
}
