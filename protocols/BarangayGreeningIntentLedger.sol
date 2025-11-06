// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayGreeningIntentLedger {
    address public steward;

    struct GreeningEntry {
        string barangay;
        string proposedParkType;
        string communitySupportLevel;
        string emotionalTag;
    }

    GreeningEntry[] public ledger;

    event GreeningIntentTagged(string barangay, string proposedParkType, string communitySupportLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagIntent(
        string memory barangay,
        string memory proposedParkType,
        string memory communitySupportLevel,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(GreeningEntry(barangay, proposedParkType, communitySupportLevel, emotionalTag));
        emit GreeningIntentTagged(barangay, proposedParkType, communitySupportLevel, emotionalTag);
    }
}
