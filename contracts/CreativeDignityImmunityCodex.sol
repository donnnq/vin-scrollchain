// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreativeDignityImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string creatorLabel;
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

    function submitImmunity(string memory creatorLabel, string memory protectionScope, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(creatorLabel, protectionScope, emotionalTag, false, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function breachImmunity(uint256 index) external onlyAdmin {
        entries[index].breached = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
