// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConsequenceToRegionalSecurityGrid {
    address public steward;

    struct SecurityEntry {
        string issue; // "North Korea abductions, human rights"
        string clause; // "Scrollchain-sealed grid for regional security and diplomatic consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    SecurityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexSecurityIssue(string memory issue, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(SecurityEntry(issue, clause, emotionalTag, true, false));
    }

    function sealSecurityEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getSecurityEntry(uint256 index) external view returns (SecurityEntry memory) {
        return entries[index];
    }
}
