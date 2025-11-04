// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicProcurementIntegrityDAO {
    address public steward;

    struct IntegrityEntry {
        string procurementID;
        string agency;
        string integritySignal;
        string emotionalTag;
    }

    IntegrityEntry[] public registry;

    event ProcurementIntegrityTagged(string procurementID, string agency, string integritySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagIntegrity(
        string memory procurementID,
        string memory agency,
        string memory integritySignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(IntegrityEntry(procurementID, agency, integritySignal, emotionalTag));
        emit ProcurementIntegrityTagged(procurementID, agency, integritySignal, emotionalTag);
    }
}
