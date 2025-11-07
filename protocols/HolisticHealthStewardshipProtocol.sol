// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HolisticHealthStewardshipProtocol {
    address public steward;

    struct HealthEntry {
        string barangay;
        string timestamp;
        string wellnessPillar;
        string initiative;
        string emotionalTag;
    }

    HealthEntry[] public protocol;

    event HealthStewardshipLogged(string barangay, string timestamp, string wellnessPillar, string initiative, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logStewardship(
        string memory barangay,
        string memory timestamp,
        string memory wellnessPillar,
        string memory initiative,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(HealthEntry(barangay, timestamp, wellnessPillar, initiative, emotionalTag));
        emit HealthStewardshipLogged(barangay, timestamp, wellnessPillar, initiative, emotionalTag);
    }
}
