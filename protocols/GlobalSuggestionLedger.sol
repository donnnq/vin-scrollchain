// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalSuggestionLedger {
    address public admin;

    struct SuggestionEntry {
        string productName;
        string countryTarget;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool exported;
    }

    SuggestionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSuggestion(string memory productName, string memory countryTarget, string memory emotionalTag) external onlyAdmin {
        entries.push(SuggestionEntry(productName, countryTarget, emotionalTag, true, false, false));
    }

    function reviewSuggestion(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function exportSuggestion(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].exported = true;
    }

    function getSuggestionEntry(uint256 index) external view returns (SuggestionEntry memory) {
        return entries[index];
    }
}
