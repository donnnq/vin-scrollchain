// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GameSuggestionPollDAO {
    address public admin;

    struct PollEntry {
        string gameTitle;
        string suggestedBy;
        uint256 voteCount;
        string emotionalTag;
        bool shortlisted;
    }

    PollEntry[] public polls;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function suggestGame(string memory gameTitle, string memory suggestedBy, string memory emotionalTag) external onlyAdmin {
        polls.push(PollEntry(gameTitle, suggestedBy, 0, emotionalTag, false));
    }

    function voteGame(uint256 index) external {
        polls[index].voteCount += 1;
    }

    function shortlistGame(uint256 index) external onlyAdmin {
        polls[index].shortlisted = true;
    }

    function getPoll(uint256 index) external view returns (PollEntry memory) {
        return polls[index];
    }
}
