// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecurityToDiplomaticPressureGrid {
    address public steward;

    struct PressureEntry {
        string issue; // "North Korea abductions, human rights"
        string clause; // "Scrollchain-sealed grid for diplomatic pressure and regional consequence"
        string emotionalTag;
        bool indexed;
        bool activated;
    }

    PressureEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activatePressure(string memory issue, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(PressureEntry(issue, clause, emotionalTag, true, true));
    }

    function getPressureEntry(uint256 index) external view returns (PressureEntry memory) {
        return entries[index];
    }
}
