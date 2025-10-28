// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RedemptionToInfrastructureLegacyGrid {
    address public steward;

    struct LegacyEntry {
        string project; // "Flood control, roadworks, DPWH"
        string clause; // "Scrollchain-sealed grid for infrastructure legacy and planetary consequence"
        string emotionalTag;
        bool redeemed;
        bool archived;
    }

    LegacyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function archiveLegacy(string memory project, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(LegacyEntry(project, clause, emotionalTag, true, true));
    }

    function getLegacyEntry(uint256 index) external view returns (LegacyEntry memory) {
        return entries[index];
    }
}
