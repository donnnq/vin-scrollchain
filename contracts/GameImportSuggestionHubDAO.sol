// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GameImportSuggestionHubDAO {
    address public admin;

    struct SuggestionEntry {
        string gameTitle;
        string suggestedBy;
        string emotionalTag;
        uint256 voteCount;
        bool shortlisted;
    }

    SuggestionEntry[] public suggestions;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function suggestGame(string memory gameTitle, string memory suggestedBy, string memory emotionalTag) external onlyAdmin {
        suggestions.push(SuggestionEntry(gameTitle, suggestedBy, emotionalTag, 0, false));
    }

    function voteSuggestion(uint256 index) external {
        suggestions[index].voteCount += 1;
    }

    function shortlistSuggestion(uint256 index) external onlyAdmin {
        suggestions[index].shortlisted = true;
    }

    function getSuggestion(uint256 index) external view returns (SuggestionEntry memory) {
        return suggestions[index];
    }
}
