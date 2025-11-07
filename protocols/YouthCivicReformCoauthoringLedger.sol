// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthCivicReformCoauthoringLedger {
    address public steward;

    struct CoauthorEntry {
        string timestamp;
        string youthName;
        string barangay;
        string reformTitle;
        string emotionalTag;
    }

    CoauthorEntry[] public ledger;

    event CivicReformCoauthored(string timestamp, string youthName, string barangay, string reformTitle, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logCoauthoring(
        string memory timestamp,
        string memory youthName,
        string memory barangay,
        string memory reformTitle,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(CoauthorEntry(timestamp, youthName, barangay, reformTitle, emotionalTag));
        emit CivicReformCoauthored(timestamp, youthName, barangay, reformTitle, emotionalTag);
    }
}
