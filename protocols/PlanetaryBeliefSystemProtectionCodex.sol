// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryBeliefSystemProtectionCodex {
    address public admin;

    struct BeliefEntry {
        string beliefSystem;
        string region;
        string emotionalTag;
        bool summoned;
        bool archived;
        bool protected;
    }

    BeliefEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBelief(string memory beliefSystem, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(BeliefEntry(beliefSystem, region, emotionalTag, true, false, false));
    }

    function archiveBelief(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function protectBelief(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getBeliefEntry(uint256 index) external view returns (BeliefEntry memory) {
        return entries[index];
    }
}
