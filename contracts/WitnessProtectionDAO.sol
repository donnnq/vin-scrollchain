// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WitnessProtectionDAO {
    address public admin;

    struct ProtectionEntry {
        string witnessName;
        string protectionProtocol;
        string emotionalTag;
        bool summoned;
        bool granted;
    }

    ProtectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProtection(string memory witnessName, string memory protectionProtocol, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(witnessName, protectionProtocol, emotionalTag, true, false));
    }

    function grantProtection(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
