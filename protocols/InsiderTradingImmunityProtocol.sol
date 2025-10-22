// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InsiderTradingImmunityProtocol {
    address public steward;

    struct ImmunityEntry {
        string officialRole; // "Congress", "Cabinet", "Regulatory agency"
        string immunitySignal; // "Ban on individual stock trading", "Blind trust requirement", "Real-time disclosure"
        string emotionalTag;
        bool immune;
        bool sealed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function grantImmunity(string memory officialRole, string memory immunitySignal, string memory emotionalTag) external onlySteward {
        entries.push(ImmunityEntry(officialRole, immunitySignal, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlySteward {
        require(entries[index].immune, "Must be immune first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
