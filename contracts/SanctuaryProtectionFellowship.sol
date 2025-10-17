// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctuaryProtectionFellowship {
    address public admin;

    struct ProtectionEntry {
        string sanctuaryName;
        string corridor;
        string emotionalTag;
        bool deployed;
        bool reinforced;
    }

    ProtectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployProtection(string memory sanctuaryName, string memory corridor, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(sanctuaryName, corridor, emotionalTag, true, false));
    }

    function reinforceProtection(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getProtection(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
