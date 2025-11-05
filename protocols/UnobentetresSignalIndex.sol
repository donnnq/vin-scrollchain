// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnobentetresSignalIndex {
    address public steward;

    struct SignalEntry {
        string batchCode;
        string veteranName;
        string legacySignal;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event UnobentetresSignalTagged(string batchCode, string veteranName, string legacySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSignal(
        string memory batchCode,
        string memory veteranName,
        string memory legacySignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(batchCode, veteranName, legacySignal, emotionalTag));
        emit UnobentetresSignalTagged(batchCode, veteranName, legacySignal, emotionalTag);
    }
}
