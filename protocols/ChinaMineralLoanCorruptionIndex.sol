// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ChinaMineralLoanCorruptionIndex {
    address public steward;

    struct CorruptionEntry {
        string timestamp;
        string recipientEntity;
        string loanAmount;
        string resourceType;
        string corruptionSignal;
        string transparencyBreachTag;
    }

    CorruptionEntry[] public index;

    event MineralLoanCorruptionIndexed(string timestamp, string recipientEntity, string loanAmount, string resourceType, string corruptionSignal, string transparencyBreachTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexCorruption(
        string memory timestamp,
        string memory recipientEntity,
        string memory loanAmount,
        string memory resourceType,
        string memory corruptionSignal,
        string memory transparencyBreachTag
    ) public onlySteward {
        index.push(CorruptionEntry(timestamp, recipientEntity, loanAmount, resourceType, corruptionSignal, transparencyBreachTag));
        emit MineralLoanCorruptionIndexed(timestamp, recipientEntity, loanAmount, resourceType, corruptionSignal, transparencyBreachTag);
    }
}
