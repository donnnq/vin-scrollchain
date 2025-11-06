// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NYCGhostTownLedger {
    address public steward;

    struct GhostEntry {
        string borough;
        string businessName;
        string departureReason;
        string emotionalTag;
    }

    GhostEntry[] public ledger;

    event GhostTownTagged(string borough, string businessName, string departureReason, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagGhostTown(
        string memory borough,
        string memory businessName,
        string memory departureReason,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(GhostEntry(borough, businessName, departureReason, emotionalTag));
        emit GhostTownTagged(borough, businessName, departureReason, emotionalTag);
    }
}
