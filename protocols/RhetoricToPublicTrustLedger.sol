// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RhetoricToPublicTrustLedger {
    address public steward;

    struct TrustEntry {
        string statement; // "Get rid of Obamacare", "Healthcare for illegal immigrants"
        string trustImpact; // "Erosion", "Polarization", "Misinformation"
        string emotionalTag;
        bool logged;
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

    function logTrustImpact(string memory statement, string memory trustImpact, string memory emotionalTag) external onlySteward {
        entries.push(TrustEntry(statement, trustImpact, emotionalTag, true, false));
    }

    function sealTrustEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getTrustEntry(uint256 index) external view returns (TrustEntry memory) {
        return entries[index];
    }
}
