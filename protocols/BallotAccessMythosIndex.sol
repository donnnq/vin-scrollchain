// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BallotAccessMythosIndex {
    address public admin;

    struct MythosEntry {
        string campaignName; // "Smart & Safe Florida"
        string accessEvent; // "Signature invalidation", "Legal challenge", "Reinstatement"
        string mythosSignal; // "Democracy breach", "Civic resilience"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    MythosEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function indexMythos(string memory campaignName, string memory accessEvent, string memory mythosSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(MythosEntry(campaignName, accessEvent, mythosSignal, emotionalTag, true, false));
    }

    function sealMythosEntry(uint256 index) external onlyAdmin {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getMythosEntry(uint256 index) external view returns (MythosEntry memory) {
        return entries[index];
    }
}
