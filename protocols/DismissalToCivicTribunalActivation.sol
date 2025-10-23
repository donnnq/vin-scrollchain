// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DismissalToCivicTribunalActivation {
    address public steward;

    struct TribunalEntry {
        string caseName; // "Joel Villanueva PDAF case"
        string dismissalOrderDate;
        string tribunalType; // "Civic hearing", "Public arbitration", "Senate review"
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

    function activateTribunal(string memory caseName, string memory dismissalOrderDate, string memory tribunalType, string memory emotionalTag) external onlySteward {
        entries.push(TribunalEntry(caseName, dismissalOrderDate, tribunalType, emotionalTag, true, false));
    }

    function sealTribunalEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
