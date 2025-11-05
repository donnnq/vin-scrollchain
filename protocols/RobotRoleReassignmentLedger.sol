// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RobotRoleReassignmentLedger {
    address public steward;

    struct ReassignmentEntry {
        string robotID;
        string previousRole;
        string reassignedRole;
        string emotionalTag;
    }

    ReassignmentEntry[] public ledger;

    event RobotRoleReassigned(string robotID, string previousRole, string reassignedRole, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function reassignRole(
        string memory robotID,
        string memory previousRole,
        string memory reassignedRole,
        string memory emotionalTag
    ) public onlySteard {
        ledger.push(ReassignmentEntry(robotID, previousRole, reassignedRole, emotionalTag));
        emit RobotRoleReassigned(robotID, previousRole, reassignedRole, emotionalTag);
    }
}
