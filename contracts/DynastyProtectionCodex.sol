// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynastyProtectionCodex {
    address public admin;

    struct ProtectionEntry {
        string familyName;
        string linkedCase;
        string protectionType;
        string emotionalTag;
        bool documented;
        bool flagged;
    }

    ProtectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logProtection(string memory familyName, string memory linkedCase, string memory protectionType, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(familyName, linkedCase, protectionType, emotionalTag, true, false));
    }

    function flagProtection(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function getProtection(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
