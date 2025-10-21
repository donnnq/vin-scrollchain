// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalCivicReflectionProtocol {
    address public admin;

    struct ReflectionEntry {
        string city;
        string reflectionType; // "Quiet Zone Activation", "Public Dialogue Space", "Emotional Safety Ritual"
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    ReflectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReflection(string memory city, string memory reflectionType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ReflectionEntry(city, reflectionType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealReflectionEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getReflectionEntry(uint256 index) external view returns (ReflectionEntry memory) {
        return entries[index];
    }
}
