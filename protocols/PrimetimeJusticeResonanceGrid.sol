// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrimetimeJusticeResonanceGrid {
    address public admin;

    struct ResonanceEntry {
        string segmentTitle;
        string anchorName;
        string resonanceLayer; // "Public Reaction", "Emotional Impact", "Institutional Echo"
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    ResonanceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonResonance(string memory segmentTitle, string memory anchorName, string memory resonanceLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(ResonanceEntry(segmentTitle, anchorName, resonanceLayer, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealResonanceEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getResonanceEntry(uint256 index) external view returns (ResonanceEntry memory) {
        return entries[index];
    }
}
