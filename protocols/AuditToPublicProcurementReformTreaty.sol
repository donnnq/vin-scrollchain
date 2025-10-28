// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditToPublicProcurementReformTreaty {
    address public steward;

    struct ReformEntry {
        string department; // "DPWH"
        string clause; // "Scrollchain-sealed treaty for public procurement reform and budget transparency consequence"
        string emotionalTag;
        bool ratified;
        bool archived;
    }

    ReformEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyProcurementTreaty(string memory department, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ReformEntry(department, clause, emotionalTag, true, true));
    }

    function getReformEntry(uint256 index) external view returns (ReformEntry memory) {
        return entries[index];
    }
}
