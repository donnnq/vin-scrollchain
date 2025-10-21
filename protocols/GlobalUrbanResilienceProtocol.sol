// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalUrbanResilienceProtocol {
    address public admin;

    struct ResilienceEntry {
        string city;
        string resilienceType; // "Flood Drainage", "Heat Shelters", "Emergency Access", "Green Buffer"
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    ResilienceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonResilience(string memory city, string memory resilienceType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ResilienceEntry(city, resilienceType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealResilienceEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getResilienceEntry(uint256 index) external view returns (ResilienceEntry memory) {
        return entries[index];
    }
}
