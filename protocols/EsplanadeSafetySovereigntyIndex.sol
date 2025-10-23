// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EsplanadeSafetySovereigntyIndex {
    address public steward;

    struct SafetyEntry {
        string location;
        string safetySignal; // "Guard rotation", "CCTV patrol", "Vendor overflow control"
        string communityImpact; // "Walkway access", "Cleanliness", "Public trust"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    SafetyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexSafety(string memory location, string memory safetySignal, string memory communityImpact, string memory emotionalTag) external onlySteward {
        entries.push(SafetyEntry(location, safetySignal, communityImpact, emotionalTag, true, false));
    }

    function sealSafetyEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getSafetyEntry(uint256 index) external view returns (SafetyEntry memory) {
        return entries[index];
    }
}
