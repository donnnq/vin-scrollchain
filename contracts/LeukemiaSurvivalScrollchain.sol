// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LeukemiaSurvivalScrollchain {
    address public admin;

    struct SurvivalEntry {
        string trialName;
        string drugCandidate;
        string emotionalTag;
        bool summoned;
        bool archived;
    }

    SurvivalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSurvival(string memory trialName, string memory drugCandidate, string memory emotionalTag) external onlyAdmin {
        entries.push(SurvivalEntry(trialName, drugCandidate, emotionalTag, true, false));
    }

    function archiveSurvival(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getSurvivalEntry(uint256 index) external view returns (SurvivalEntry memory) {
        return entries[index];
    }
}
