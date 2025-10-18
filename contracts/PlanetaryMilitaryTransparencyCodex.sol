// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryMilitaryTransparencyCodex {
    address public admin;

    struct TransparencyEntry {
        string nation;
        string militaryAction;
        string emotionalTag;
        bool summoned;
        bool archived;
    }

    TransparencyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTransparency(string memory nation, string memory militaryAction, string memory emotionalTag) external onlyAdmin {
        entries.push(TransparencyEntry(nation, militaryAction, emotionalTag, true, false));
    }

    function archiveTransparency(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getTransparencyEntry(uint256 index) external view returns (TransparencyEntry memory) {
        return entries[index];
    }
}
