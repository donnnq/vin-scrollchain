// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StayInStayOutPreferenceLedger {
    address public steward;

    struct PreferenceEntry {
        string workerName;
        string companyName;
        string timestamp;
        string preference;
        string emotionalTag;
    }

    PreferenceEntry[] public ledger;

    event PreferenceLogged(string workerName, string companyName, string timestamp, string preference, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logPreference(
        string memory workerName,
        string memory companyName,
        string memory timestamp,
        string memory preference,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(PreferenceEntry(workerName, companyName, timestamp, preference, emotionalTag));
        emit PreferenceLogged(workerName, companyName, timestamp, preference, emotionalTag);
    }
}
