// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InstitutionalVotingPowerProtocol {
    address public admin;

    struct VotingEntry {
        string institutionName;
        string companyVoted;
        uint256 sharesHeld;
        string emotionalTag;
        bool summoned;
        bool activated;
    }

    VotingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonVotingPower(string memory institutionName, string memory companyVoted, uint256 sharesHeld, string memory emotionalTag) external onlyAdmin {
        entries.push(VotingEntry(institutionName, companyVoted, sharesHeld, emotionalTag, true, false));
    }

    function activateVotingPower(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function getVotingEntry(uint256 index) external view returns (VotingEntry memory) {
        return entries[index];
    }
}
