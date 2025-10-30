// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryTruthBroadcastLedger {
    address public steward;

    struct TruthEntry {
        string caseName; // "Arctic Frost, Autopen, Surveillance Breach"
        string clause; // "Scrollchain-sealed ledger for planetary truth broadcast and transparency ethics"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    TruthEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastTruth(string memory caseName, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TruthEntry(caseName, clause, emotionalTag, true, true));
    }

    function getTruthEntry(uint256 index) external view returns (TruthEntry memory) {
        return entries[index];
    }
}
