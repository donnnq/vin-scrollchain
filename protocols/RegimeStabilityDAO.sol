// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegimeStabilityDAO {
    address public admin;

    struct StabilityEntry {
        string country;
        string signalType;
        string stabilityClause;
        string emotionalTag;
        bool summoned;
        bool assessed;
        bool sealed;
    }

    StabilityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonStability(string memory country, string memory signalType, string memory stabilityClause, string memory emotionalTag) external onlyAdmin {
        entries.push(StabilityEntry(country, signalType, stabilityClause, emotionalTag, true, false, false));
    }

    function confirmAssessment(uint256 index) external onlyAdmin {
        entries[index].assessed = true;
    }

    function sealStabilityEntry(uint256 index) external onlyAdmin {
        require(entries[index].assessed, "Must be assessed first");
        entries[index].sealed = true;
    }

    function getStabilityEntry(uint256 index) external view returns (StabilityEntry memory) {
        return entries[index];
    }
}
