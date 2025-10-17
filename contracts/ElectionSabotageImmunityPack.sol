// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ElectionSabotageImmunityPack {
    address public admin;

    struct ImmunityEntry {
        string actorName;
        string sabotageTheme;
        string emotionalTag;
        bool flagged;
        bool immunized;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function flagSabotage(string memory actorName, string memory sabotageTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(actorName, sabotageTheme, emotionalTag, true, false));
    }

    function immunizeActor(uint256 index) external onlyAdmin {
        entries[index].immunized = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
