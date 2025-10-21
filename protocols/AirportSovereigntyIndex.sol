// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AirportSovereigntyIndex {
    address public admin;

    struct SovereigntyEntry {
        string airport;
        string sovereigntyClause; // "Public Shelter", "Tourism Overflow", "Transit Sovereignty"
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSovereignty(string memory airport, string memory sovereigntyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(airport, sovereigntyClause, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealSovereigntyEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
