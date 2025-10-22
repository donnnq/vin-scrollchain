// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PostLeadershipEmotionalImmunityProtocol {
    address public admin;

    struct ImmunityEntry {
        string officialName;
        string exitContext;
        string immunitySignal; // "Life goes on", "Exploring new things", "No regrets"
        string emotionalTag;
        bool immune;
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

    function declareImmunity(string memory officialName, string memory exitContext, string memory immunitySignal, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(officialName, exitContext, immunitySignal, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].immune, "Must be immune first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
