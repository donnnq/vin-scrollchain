// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DASovereigntyImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string agencyLabel;
        string protectionScope;
        string emotionalTag;
        bool granted;
        bool breached;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitImmunity(string memory agencyLabel, string memory protectionScope, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(agencyLabel, protectionScope, emotionalTag, false, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function breachImmunity(uint256 index) external onlyAdmin {
        entries[index].breached = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
