// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalLaborDisplacementKarmaLedger {
    address public steward;

    struct DisplacementEntry {
        string laborSector;
        string displacementCause;
        string civicImpact;
        string emotionalTag;
    }

    DisplacementEntry[] public ledger;

    event LaborDisplacementTagged(string laborSector, string displacementCause, string civicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDisplacement(
        string memory laborSector,
        string memory displacementCause,
        string memory civicImpact,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(DisplacementEntry(laborSector, displacementCause, civicImpact, emotionalTag));
        emit LaborDisplacementTagged(laborSector, displacementCause, civicImpact, emotionalTag);
    }
}
