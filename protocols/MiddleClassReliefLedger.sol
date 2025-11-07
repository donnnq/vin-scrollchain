// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiddleClassReliefLedger {
    address public steward;

    struct ReliefEntry {
        string timestamp;
        string familyID;
        string inflationIndex;
        string monthlyReliefAmount;
        string emotionalTag;
    }

    ReliefEntry[] public ledger;

    event MiddleClassReliefLogged(string timestamp, string familyID, string inflationIndex, string monthlyReliefAmount, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logRelief(
        string memory timestamp,
        string memory familyID,
        string memory inflationIndex,
        string memory monthlyReliefAmount,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ReliefEntry(timestamp, familyID, inflationIndex, monthlyReliefAmount, emotionalTag));
        emit MiddleClassReliefLogged(timestamp, familyID, inflationIndex, monthlyReliefAmount, emotionalTag);
    }
}
