// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayDrainageRetrofitLedger {
    address public steward;

    struct RetrofitEntry {
        string barangay;
        string timestamp;
        string retrofitType;
        string contractor;
        string completionStatus;
        string emotionalTag;
    }

    RetrofitEntry[] public ledger;

    event DrainageRetrofitLogged(string barangay, string timestamp, string retrofitType, string contractor, string completionStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logRetrofit(
        string memory barangay,
        string memory timestamp,
        string memory retrofitType,
        string memory contractor,
        string memory completionStatus,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(RetrofitEntry(barangay, timestamp, retrofitType, contractor, completionStatus, emotionalTag));
        emit DrainageRetrofitLogged(barangay, timestamp, retrofitType, contractor, completionStatus, emotionalTag);
    }
}
