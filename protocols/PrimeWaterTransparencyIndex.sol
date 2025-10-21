// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrimeWaterTransparencyIndex {
    address public admin;

    struct TransparencyEntry {
        string zone;
        string issueType; // "No Advisory", "Delayed Response", "Tank Absence"
        string indexClause;
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    TransparencyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTransparency(string memory zone, string memory issueType, string memory indexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TransparencyEntry(zone, issueType, indexClause, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealTransparencyEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getTransparencyEntry(uint256 index) external view returns (TransparencyEntry memory) {
        return entries[index];
    }
}
