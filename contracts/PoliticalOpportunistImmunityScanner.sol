// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoliticalOpportunistImmunityScanner {
    address public admin;

    struct ImmunityEntry {
        string actorName;
        string issueHijacked;
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

    function flagOpportunist(string memory actorName, string memory issueHijacked, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(actorName, issueHijacked, emotionalTag, true, false));
    }

    function immunizeActor(uint256 index) external onlyAdmin {
        entries[index].immunized = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
