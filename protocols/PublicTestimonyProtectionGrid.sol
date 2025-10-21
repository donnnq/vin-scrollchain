// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicTestimonyProtectionGrid {
    address public admin;

    struct TestimonyEntry {
        string speaker;
        string platform;
        string testimonyType; // "Livestream", "Commentary", "Whistleblower Clip"
        string emotionalTag;
        bool summoned;
        bool shielded;
        bool sealed;
    }

    TestimonyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTestimony(string memory speaker, string memory platform, string memory testimonyType, string memory emotionalTag) external onlyAdmin {
        entries.push(TestimonyEntry(speaker, platform, testimonyType, emotionalTag, true, false, false));
    }

    function confirmShielding(uint256 index) external onlyAdmin {
        entries[index].shielded = true;
    }

    function sealTestimonyEntry(uint256 index) external onlyAdmin {
        require(entries[index].shielded, "Must be shielded first");
        entries[index].sealed = true;
    }

    function getTestimonyEntry(uint256 index) external view returns (TestimonyEntry memory) {
        return entries[index];
    }
}
