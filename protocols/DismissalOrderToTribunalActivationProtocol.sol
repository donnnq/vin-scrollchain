// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DismissalOrderToTribunalActivationProtocol {
    address public steward;

    struct TribunalEntry {
        string respondent; // "Senator Joel Villanueva"
        string originalOrderDate; // "2015"
        string revivalTrigger; // "Remulla statement", "Headstart interview"
        string tribunalType; // "Public hearing", "Civic tribunal"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    TribunalEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateTribunal(string memory respondent, string memory originalOrderDate, string memory revivalTrigger, string memory tribunalType, string memory emotionalTag) external onlySteward {
        entries.push(TribunalEntry(respondent, originalOrderDate, revivalTrigger, tribunalType, emotionalTag, true, false));
    }

    function sealTribunalEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
