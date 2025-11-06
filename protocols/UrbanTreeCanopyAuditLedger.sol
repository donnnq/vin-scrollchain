// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanTreeCanopyAuditLedger {
    address public steward;

    struct CanopyEntry {
        string location;
        string treeSpecies;
        string canopyCoverage;
        string ecologicalSignal;
        string emotionalTag;
    }

    CanopyEntry[] public ledger;

    event TreeCanopyAudited(string location, string treeSpecies, string canopyCoverage, string ecologicalSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditCanopy(
        string memory location,
        string memory treeSpecies,
        string memory canopyCoverage,
        string memory ecologicalSignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(CanopyEntry(location, treeSpecies, canopyCoverage, ecologicalSignal, emotionalTag));
        emit TreeCanopyAudited(location, treeSpecies, canopyCoverage, ecologicalSignal, emotionalTag);
    }
}
