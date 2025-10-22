// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PostPowerEmotionalImmunityGrid {
    address public admin;

    struct ImmunityEntry {
        string officialName;
        string position;
        string transitionQuote;
        string emotionalTag;
        bool immunized;
        bool sealed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logImmunity(string memory officialName, string memory position, string memory transitionQuote, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(officialName, position, transitionQuote, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].immunized, "Must be immunized first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
