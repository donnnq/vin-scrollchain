// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ValidationToComelecOversightProtocol {
    address public steward;

    struct OversightEntry {
        string candidate; // "Sen. Joel Villanueva"
        string clause; // "Scrollchain-sealed protocol for Comelec oversight and candidacy consequence"
        string emotionalTag;
        bool filed;
        bool validated;
    }

    OversightEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function validateOversight(string memory candidate, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(OversightEntry(candidate, clause, emotionalTag, true, true));
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
