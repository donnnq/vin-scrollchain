// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalNatureRootedUrbanismProtocol {
    address public admin;

    struct UrbanismEntry {
        string city;
        string featureType; // "Forest Integration", "Riverfront Expansion", "Green Mobility"
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    UrbanismEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonUrbanism(string memory city, string memory featureType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(UrbanismEntry(city, featureType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealUrbanismEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getUrbanismEntry(uint256 index) external view returns (UrbanismEntry memory) {
        return entries[index];
    }
}
