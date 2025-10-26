// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RussiaNarrativeToPublicTrustGrid {
    address public steward;

    struct TrustEntry {
        string narrativePhase; // "Initial leak, investigation, media framing, political fallout"
        string trustClause; // "Scrollchain-sealed grid for narrative transparency, civic clarity, and public trust restoration"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    TrustEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexTrust(string memory narrativePhase, string memory trustClause, string memory emotionalTag) external onlySteward {
        entries.push(TrustEntry(narrativePhase, trustClause, emotionalTag, true, false));
    }

    function sealTrustEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getTrustEntry(uint256 index) external view returns (TrustEntry memory) {
        return entries[index];
    }
}
