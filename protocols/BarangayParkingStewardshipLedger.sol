// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayParkingStewardshipLedger {
    address public steward;

    struct StewardEntry {
        string barangay;
        string stewardshipRole;
        string maintenanceProtocol;
        string emotionalTag;
    }

    StewardEntry[] public ledger;

    event ParkingStewardTagged(string barangay, string stewardshipRole, string maintenanceProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSteward(
        string memory barangay,
        string memory stewardshipRole,
        string memory maintenanceProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(StewardEntry(barangay, stewardshipRole, maintenanceProtocol, emotionalTag));
        emit ParkingStewardTagged(barangay, stewardshipRole, maintenanceProtocol, emotionalTag);
    }
}
