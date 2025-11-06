// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CapitalFlightAuditProtocol {
    address public steward;

    struct FlightEntry {
        string companyName;
        string originState;
        string destinationState;
        string financialImpact;
        string emotionalTag;
    }

    FlightEntry[] public registry;

    event CapitalFlightTagged(string companyName, string originState, string destinationState, string financialImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFlight(
        string memory companyName,
        string memory originState,
        string memory destinationState,
        string memory financialImpact,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(FlightEntry(companyName, originState, destinationState, financialImpact, emotionalTag));
        emit CapitalFlightTagged(companyName, originState, destinationState, financialImpact, emotionalTag);
    }
}
