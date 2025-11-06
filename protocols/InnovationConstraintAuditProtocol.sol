// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InnovationConstraintAuditProtocol {
    address public steward;

    struct ConstraintEntry {
        string policyName;
        string techSector;
        string constraintType;
        string emotionalTag;
    }

    ConstraintEntry[] public protocol;

    event InnovationConstraintTagged(string policyName, string techSector, string constraintType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagConstraint(
        string memory policyName,
        string memory techSector,
        string memory constraintType,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(ConstraintEntry(policyName, techSector, constraintType, emotionalTag));
        emit InnovationConstraintTagged(policyName, techSector, constraintType, emotionalTag);
    }
}
