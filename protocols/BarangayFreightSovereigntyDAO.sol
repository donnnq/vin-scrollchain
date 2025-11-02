// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayFreightSovereigntyDAO {
    address public steward;

    struct SovereigntyEntry {
        string barangay;
        string freightOperator;
        string sovereigntyStatus;
        string emotionalTag;
    }

    SovereigntyEntry[] public registry;

    event FreightSovereigntyTagged(string barangay, string freightOperator, string sovereigntyStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagSovereignty(
        string memory barangay,
        string memory freightOperator,
        string memory sovereigntyStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SovereigntyEntry(barangay, freightOperator, sovereigntyStatus, emotionalTag));
        emit FreightSovereigntyTagged(barangay, freightOperator, sovereigntyStatus, emotionalTag);
    }
}
