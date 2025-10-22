// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICEAgentProtectionGrid {
    address public admin;

    struct ProtectionEntry {
        string threatType; // "Violence against agents", "Public hostility", "Operational sabotage"
        string protectionSignal; // "Bodycam deployment", "Legal shield", "Community engagement"
        string emotionalTag;
        bool protected;
        bool sealed;
    }

    ProtectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function protectAgent(string memory threatType, string memory protectionSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(threatType, protectionSignal, emotionalTag, true, false));
    }

    function sealProtectionEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getProtectionEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
