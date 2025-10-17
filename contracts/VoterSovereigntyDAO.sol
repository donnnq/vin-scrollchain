// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VoterSovereigntyDAO {
    address public admin;

    struct SovereigntyEntry {
        string region;
        string voterConcern;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonConcern(string memory region, string memory voterConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(region, voterConcern, emotionalTag, true, false));
    }

    function resolveConcern(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
