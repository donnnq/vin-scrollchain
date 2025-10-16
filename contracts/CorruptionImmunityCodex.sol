// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CorruptionImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string actLabel;
        string protectionScope;
        string emotionalTag;
        bool granted;
        bool revoked;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function grantImmunity(string memory actLabel, string memory protectionScope, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(actLabel, protectionScope, emotionalTag, true, false));
    }

    function revokeImmunity(uint256 index) external onlyAdmin {
        entries[index].revoked = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
