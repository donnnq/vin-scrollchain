// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PassengerCapacityResilienceLedger {
    address public steward;

    struct CapacityEntry {
        string trainSetID;
        string routeSegment;
        string capacityProtocol;
        string emotionalTag;
    }

    CapacityEntry[] public ledger;

    event CapacityResilienceTagged(string trainSetID, string routeSegment, string capacityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCapacity(
        string memory trainSetID,
        string memory routeSegment,
        string memory capacityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(CapacityEntry(trainSetID, routeSegment, capacityProtocol, emotionalTag));
        emit CapacityResilienceTagged(trainSetID, routeSegment, capacityProtocol, emotionalTag);
    }
}
