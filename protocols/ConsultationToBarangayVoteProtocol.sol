// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConsultationToBarangayVoteProtocol {
    address public steward;

    struct VoteEntry {
        string projectName; // "Tagaytay Flyover"
        string designFeature; // "Snake-like curve"
        string voteMethod; // "Barangay assembly", "Scrollchain poll", "Community ratification"
        string emotionalTag;
        bool voted;
        bool sealed;
    }

    VoteEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logVote(string memory projectName, string memory designFeature, string memory voteMethod, string memory emotionalTag) external onlySteward {
        entries.push(VoteEntry(projectName, designFeature, voteMethod, emotionalTag, true, false));
    }

    function sealVoteEntry(uint256 index) external onlySteward {
        require(entries[index].voted, "Must be voted first");
        entries[index].sealed = true;
    }

    function getVoteEntry(uint256 index) external view returns (VoteEntry memory) {
        return entries[index];
    }
}
