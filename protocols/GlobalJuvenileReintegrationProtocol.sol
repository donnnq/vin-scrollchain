// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalJuvenileReintegrationProtocol {
    address public admin;

    struct ReintegrationEntry {
        string city;
        string reintegrationType; // "Rescue & Counseling", "Livelihood Training", "Barangay Reintegration"
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool completed;
        bool sealed;
    }

    ReintegrationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReintegration(string memory city, string memory reintegrationType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ReintegrationEntry(city, reintegrationType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmCompletion(uint256 index) external onlyAdmin {
        entries[index].completed = true;
    }

    function sealReintegrationEntry(uint256 index) external onlyAdmin {
        require(entries[index].completed, "Must be completed first");
        entries[index].sealed = true;
    }

    function getReintegrationEntry(uint256 index) external view returns (ReintegrationEntry memory) {
        return entries[index];
    }
}
