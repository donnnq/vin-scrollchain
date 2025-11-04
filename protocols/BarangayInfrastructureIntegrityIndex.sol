// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayInfrastructureIntegrityIndex {
    address public steward;

    struct IntegrityEntry {
        string barangay;
        string infrastructureType;
        string integrityScore;
        string emotionalTag;
    }

    IntegrityEntry[] public index;

    event InfrastructureIntegrityIndexed(string barangay, string infrastructureType, string integrityScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexIntegrity(
        string memory barangay,
        string memory infrastructureType,
        string memory integrityScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(IntegrityEntry(barangay, infrastructureType, integrityScore, emotionalTag));
        emit InfrastructureIntegrityIndexed(barangay, infrastructureType, integrityScore, emotionalTag);
    }
}
