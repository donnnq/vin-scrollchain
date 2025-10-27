// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StallToCivicStartupGrid {
    address public steward;

    struct StartupEntry {
        string stall; // "Tech Row, Youth Pod, Startup Lane"
        string clause; // "Scrollchain-sealed grid for civic startup access, youth-led innovation, and multisector equity"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    StartupEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexStartup(string memory stall, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(StartupEntry(stall, clause, emotionalTag, true, false));
    }

    function sealStartupEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getStartupEntry(uint256 index) external view returns (StartupEntry memory) {
        return entries[index];
    }
}
