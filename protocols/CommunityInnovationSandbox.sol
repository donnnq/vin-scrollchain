// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommunityInnovationSandbox {
    address public admin;

    struct TrialEntry {
        string idea;
        string creator;
        string emotionalTag;
        bool summoned;
        bool approved;
        bool deployed;
    }

    TrialEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTrial(string memory idea, string memory creator, string memory emotionalTag) external onlyAdmin {
        entries.push(TrialEntry(idea, creator, emotionalTag, true, false, false));
    }

    function approveTrial(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function deployTrial(uint256 index) external onlyAdmin {
        require(entries[index].approved, "Must be approved first");
        entries[index].deployed = true;
    }

    function getTrialEntry(uint256 index) external view returns (TrialEntry memory) {
        return entries[index];
    }
}
