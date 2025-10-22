// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OngPingEmpowermentProtocol {
    address public admin;

    struct SuggestionEntry {
        string suggestion; // "ICI must be independent", "Give prosecutorial teeth", "Ritualize transparency"
        string implementationMethod; // "Budget autonomy", "Direct case filing", "Livestream hearings"
        string emotionalTag;
        bool empowered;
        bool sealed;
    }

    SuggestionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function empowerSuggestion(string memory suggestion, string memory implementationMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(SuggestionEntry(suggestion, implementationMethod, emotionalTag, true, false));
    }

    function sealSuggestionEntry(uint256 index) external onlyAdmin {
        require(entries[index].empowered, "Must be empowered first");
        entries[index].sealed = true;
    }

    function getSuggestionEntry(uint256 index) external view returns (SuggestionEntry memory) {
        return entries[index];
    }
}
