// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateInfrastructureYouthHackathonDAO {
    address public steward;

    struct HackathonEntry {
        string eventName;
        string schoolOrBarangay;
        string timestamp;
        string theme;
        string emotionalTag;
    }

    HackathonEntry[] public registry;

    event HackathonLogged(string eventName, string schoolOrBarangay, string timestamp, string theme, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logHackathon(
        string memory eventName,
        string memory schoolOrBarangay,
        string memory timestamp,
        string memory theme,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(HackathonEntry(eventName, schoolOrBarangay, timestamp, theme, emotionalTag));
        emit HackathonLogged(eventName, schoolOrBarangay, timestamp, theme, emotionalTag);
    }
}
