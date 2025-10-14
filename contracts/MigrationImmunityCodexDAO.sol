// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MigrationImmunityCodexDAO {
    address public admin;

    struct ImmunityEntry {
        string originCountry;
        string destinationRegion;
        string immunityClause;
        string emotionalTag;
        bool activated;
    }

    ImmunityEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _originCountry, string memory _destinationRegion, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(ImmunityEntry(_originCountry, _destinationRegion, _immunityClause, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        codex[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return codex[index];
    }
}
