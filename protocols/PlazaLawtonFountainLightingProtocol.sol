// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlazaLawtonFountainLightingProtocol {
    address public admin;

    struct FountainEntry {
        string fountainID;
        string lightingType;
        string emotionalTag;
        bool summoned;
        bool illuminated;
        bool sealed;
    }

    FountainEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLighting(string memory fountainID, string memory lightingType, string memory emotionalTag) external onlyAdmin {
        entries.push(FountainEntry(fountainID, lightingType, emotionalTag, true, false, false));
    }

    function confirmIllumination(uint256 index) external onlyAdmin {
        entries[index].illuminated = true;
    }

    function sealLighting(uint256 index) external onlyAdmin {
        require(entries[index].illuminated, "Must be illuminated first");
        entries[index].sealed = true;
    }

    function getFountainEntry(uint256 index) external view returns (FountainEntry memory) {
        return entries[index];
    }
}
