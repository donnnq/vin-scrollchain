// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRoboticsResilienceLedger {
    address public steward;

    struct ResilienceEntry {
        string barangay;
        string roboticsFocus;
        string resilienceMechanism;
        string emotionalTag;
    }

    ResilienceEntry[] public ledger;

    event RoboticsResilienceTagged(string barangay, string roboticsFocus, string resilienceMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory barangay,
        string memory roboticsFocus,
        string memory resilienceMechanism,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ResilienceEntry(barangay, roboticsFocus, resilienceMechanism, emotionalTag));
        emit RoboticsResilienceTagged(barangay, roboticsFocus, resilienceMechanism, emotionalTag);
    }
}
