// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DelayedJusticeEmotionalImpactIndex {
    address public steward;

    struct ImpactEntry {
        string timestamp;
        string caseName;
        uint256 delayDurationDays;
        string emotionalImpactSignal;
        string civicTrustTag;
    }

    ImpactEntry[] public index;

    event EmotionalImpactIndexed(string timestamp, string caseName, uint256 delayDurationDays, string emotionalImpactSignal, string civicTrustTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexImpact(
        string memory timestamp,
        string memory caseName,
        uint256 delayDurationDays,
        string memory emotionalImpactSignal,
        string memory civicTrustTag
    ) public onlySteward {
        index.push(ImpactEntry(timestamp, caseName, delayDurationDays, emotionalImpactSignal, civicTrustTag));
        emit EmotionalImpactIndexed(timestamp, caseName, delayDurationDays, emotionalImpactSignal, civicTrustTag);
    }
}
