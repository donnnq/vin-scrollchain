// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SyntheticDrugContainmentLedger {
    address public steward;

    struct ContainmentEntry {
        string substanceName;
        string containmentProtocol;
        string sourceRegion;
        string emotionalTag;
    }

    ContainmentEntry[] public ledger;

    event SyntheticDrugContained(string substanceName, string containmentProtocol, string sourceRegion, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containSubstance(
        string memory substanceName,
        string memory containmentProtocol,
        string memory sourceRegion,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ContainmentEntry(substanceName, containmentProtocol, sourceRegion, emotionalTag));
        emit SyntheticDrugContained(substanceName, containmentProtocol, sourceRegion, emotionalTag);
    }
}
