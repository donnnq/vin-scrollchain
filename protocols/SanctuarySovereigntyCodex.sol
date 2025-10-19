// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctuarySovereigntyCodex {
    address public admin;

    struct SanctuaryEntry {
        string location;
        string migrantGroup;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    SanctuaryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSanctuary(string memory location, string memory migrantGroup, string memory emotionalTag) external onlyAdmin {
        entries.push(SanctuaryEntry(location, migrantGroup, emotionalTag, true, false, false));
    }

    function protectSanctuary(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealSanctuary(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getSanctuaryEntry(uint256 index) external view returns (SanctuaryEntry memory) {
        return entries[index];
    }
}
