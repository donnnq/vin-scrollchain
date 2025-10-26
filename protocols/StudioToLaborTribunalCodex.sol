// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudioToLaborTribunalCodex {
    address public steward;

    struct TribunalEntry {
        string studioName; // "RTIA"
        string tribunalType; // "Live grievance broadcast, rider dignity tribunal"
        string emotionalTag;
        bool codified;
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

    function codifyTribunal(string memory studioName, string memory tribunalType, string memory emotionalTag) external onlySteward {
        entries.push(TribunalEntry(studioName, tribunalType, emotionalTag, true, false));
    }

    function sealTribunalEntry(uint256 index) external onlySteward {
        require(entries[index].codified, "Must be codified first");
        entries[index].sealed = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
