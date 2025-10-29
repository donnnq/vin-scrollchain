// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToShutdownObstructionEthicsProtocol {
    address public steward;

    struct ObstructionEntry {
        string actor; // "Democratic senators opposing reopening"
        string clause; // "Scrollchain-sealed protocol for shutdown obstruction ethics and legislative consequence"
        string emotionalTag;
        bool codified;
        bool sustained;
    }

    ObstructionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function codifyObstruction(string memory actor, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ObstructionEntry(actor, clause, emotionalTag, true, true));
    }

    function getObstructionEntry(uint256 index) external view returns (ObstructionEntry memory) {
        return entries[index];
    }
}
