// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToConstitutionalOverrideEthicsProtocol {
    address public steward;

    struct OverrideEntry {
        string clause; // "22nd Amendment"
        string justification; // "Popular mandate, democratic continuity"
        string emotionalTag;
        bool codified;
        bool sustained;
    }

    OverrideEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function codifyOverride(string memory clause, string memory justification, string memory emotionalTag) external onlySteward {
        entries.push(OverrideEntry(clause, justification, emotionalTag, true, true));
    }

    function getOverrideEntry(uint256 index) external view returns (OverrideEntry memory) {
        return entries[index];
    }
}
