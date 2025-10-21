// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicTestimonyBroadcastCodex {
    address public admin;

    struct TestimonyEntry {
        string witnessName;
        string issueType; // "Corruption", "Policy Abuse", "Infrastructure Neglect"
        string broadcastChannel;
        string emotionalTag;
        bool summoned;
        bool aired;
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

    function summonTestimony(string memory witnessName, string memory issueType, string memory broadcastChannel, string memory emotionalTag) external onlyAdmin {
        entries.push(TestimonyEntry(witnessName, issueType, broadcastChannel, emotionalTag, true, false, false));
    }

    function confirmAiring(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function sealTestimonyEntry(uint256 index) external onlyAdmin {
        require(entries[index].aired, "Must be aired first");
        entries[index].sealed = true;
    }

    function getTestimonyEntry(uint256 index) external view returns (TestimonyEntry memory) {
        return entries[index];
    }
}
