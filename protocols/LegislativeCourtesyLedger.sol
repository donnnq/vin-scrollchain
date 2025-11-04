// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegislativeCourtesyLedger {
    address public steward;

    struct CourtesyEntry {
        string sender;
        string recipient;
        string courtesySignal;
        string emotionalTag;
    }

    CourtesyEntry[] public ledger;

    event CourtesyTagged(string sender, string recipient, string courtesySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCourtesy(
        string memory sender,
        string memory recipient,
        string memory courtesySignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(CourtesyEntry(sender, recipient, courtesySignal, emotionalTag));
        emit CourtesyTagged(sender, recipient, courtesySignal, emotionalTag);
    }
}
