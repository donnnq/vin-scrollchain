// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicUnrestImmunityDAO {
    address public admin;

    struct ImmunityEntry {
        string groupName;
        string unrestType;
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

    function flagUnrest(string memory groupName, string memory unrestType, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(groupName, unrestType, emotionalTag, true, false));
    }

    function immunizeGroup(uint256 index) external onlyAdmin {
        entries[index].immunized = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
