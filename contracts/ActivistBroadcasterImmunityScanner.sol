// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ActivistBroadcasterImmunityScanner {
    address public admin;

    struct ImmunityEntry {
        string broadcasterName;
        string biasType;
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

    function flagBroadcaster(string memory broadcasterName, string memory biasType, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(broadcasterName, biasType, emotionalTag, true, false));
    }

    function immunizeBroadcaster(uint256 index) external onlyAdmin {
        entries[index].immunized = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
