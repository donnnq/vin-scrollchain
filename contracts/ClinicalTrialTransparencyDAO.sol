// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClinicalTrialTransparencyDAO {
    address public admin;

    struct TrialEntry {
        string trialName;
        string sponsor;
        string emotionalTag;
        bool summoned;
        bool published;
    }

    TrialEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTrial(string memory trialName, string memory sponsor, string memory emotionalTag) external onlyAdmin {
        entries.push(TrialEntry(trialName, sponsor, emotionalTag, true, false));
    }

    function publishTrial(uint256 index) external onlyAdmin {
        entries[index].published = true;
    }

    function getTrialEntry(uint256 index) external view returns (TrialEntry memory) {
        return entries[index];
    }
}
