// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicWhistleblowerProtectionCodex {
    address public admin;

    struct WhistleEntry {
        string alias;
        string region;
        string protectionLevel;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    WhistleEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonWhistleProtection(string memory alias, string memory region, string memory protectionLevel, string memory emotionalTag) external onlyAdmin {
        entries.push(WhistleEntry(alias, region, protectionLevel, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealWhistleEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getWhistleEntry(uint256 index) external view returns (WhistleEntry memory) {
        return entries[index];
    }
}
