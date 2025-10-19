// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiscordLureImmunityCodex {
    address public admin;

    struct LureEntry {
        string recruiterAlias;
        string platform;
        string malwareLinked;
        string emotionalTag;
        bool summoned;
        bool immunized;
        bool sealed;
    }

    LureEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLure(string memory recruiterAlias, string memory platform, string memory malwareLinked, string memory emotionalTag) external onlyAdmin {
        entries.push(LureEntry(recruiterAlias, platform, malwareLinked, emotionalTag, true, false, false));
    }

    function immunizeLure(uint256 index) external onlyAdmin {
        entries[index].immunized = true;
    }

    function sealLure(uint256 index) external onlyAdmin {
        require(entries[index].immunized, "Must be immunized first");
        entries[index].sealed = true;
    }

    function getLureEntry(uint256 index) external view returns (LureEntry memory) {
        return entries[index];
    }
}
