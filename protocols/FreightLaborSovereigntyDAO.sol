// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreightLaborSovereigntyDAO {
    address public steward;

    struct SovereigntyEntry {
        string corridor;
        string freightOperator;
        string outsourcingStatus;
        string emotionalTag;
    }

    SovereigntyEntry[] public registry;

    event LaborSovereigntyTagged(string corridor, string freightOperator, string outsourcingStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagSovereignty(
        string memory corridor,
        string memory freightOperator,
        string memory outsourcingStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SovereigntyEntry(corridor, freightOperator, outsourcingStatus, emotionalTag));
        emit LaborSovereigntyTagged(corridor, freightOperator, outsourcingStatus, emotionalTag);
    }
}
