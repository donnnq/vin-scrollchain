// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRiderSafetyDAO {
    address public steward;

    struct SafetyEntry {
        string barangay;
        string safetyProtocol;
        string enforcementPartner;
        string emotionalTag;
    }

    SafetyEntry[] public registry;

    event RiderSafetyTagged(string barangay, string safetyProtocol, string enforcementPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRiderSafety(
        string memory barangay,
        string memory safetyProtocol,
        string memory enforcementPartner,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SafetyEntry(barangay, safetyProtocol, enforcementPartner, emotionalTag));
        emit RiderSafetyTagged(barangay, safetyProtocol, enforcementPartner, emotionalTag);
    }
}
