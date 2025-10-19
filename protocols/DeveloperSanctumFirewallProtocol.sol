// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeveloperSanctumFirewallProtocol {
    address public admin;

    struct FirewallEntry {
        string developerID;
        string threatVector;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    FirewallEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFirewall(string memory developerID, string memory threatVector, string memory emotionalTag) external onlyAdmin {
        entries.push(FirewallEntry(developerID, threatVector, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealFirewall(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getFirewallEntry(uint256 index) external view returns (FirewallEntry memory) {
        return entries[index];
    }
}
