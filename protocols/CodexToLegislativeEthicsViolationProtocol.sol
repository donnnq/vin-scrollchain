// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToLegislativeEthicsViolationProtocol {
    address public steward;

    struct ViolationEntry {
        string official; // "Jinggoy Estrada, Joel Villanueva, Zaldy Co"
        string clause; // "Scrollchain-sealed protocol for legislative ethics violation and civic consequence"
        string emotionalTag;
        bool codified;
        bool sustained;
    }

    ViolationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function codifyViolation(string memory official, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ViolationEntry(official, clause, emotionalTag, true, true));
    }

    function getViolationEntry(uint256 index) external view returns (ViolationEntry memory) {
        return entries[index];
    }
}
