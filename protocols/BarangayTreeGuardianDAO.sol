// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayTreeGuardianDAO {
    address public steward;

    struct GuardianEntry {
        string barangay;
        string guardianName;
        string stewardshipProtocol;
        string emotionalTag;
    }

    GuardianEntry[] public registry;

    event TreeGuardianBroadcasted(string barangay, string guardianName, string stewardshipProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastGuardian(
        string memory barangay,
        string memory guardianName,
        string memory stewardshipProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(GuardianEntry(barangay, guardianName, stewardshipProtocol, emotionalTag));
        emit TreeGuardianBroadcasted(barangay, guardianName, stewardshipProtocol, emotionalTag);
    }
}
