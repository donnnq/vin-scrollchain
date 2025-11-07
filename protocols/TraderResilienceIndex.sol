// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TraderResilienceIndex {
    address public steward;

    struct ResilienceEntry {
        string traderID;
        string assetClass;
        uint256 recoveryAttempts;
        string timestamp;
        string emotionalTag;
    }

    ResilienceEntry[] public index;

    event ResilienceLogged(string traderID, string assetClass, uint256 recoveryAttempts, string timestamp, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logResilience(
        string memory traderID,
        string memory assetClass,
        uint256 recoveryAttempts,
        string memory timestamp,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ResilienceEntry(traderID, assetClass, recoveryAttempts, timestamp, emotionalTag));
        emit ResilienceLogged(traderID, assetClass, recoveryAttempts, timestamp, emotionalTag);
    }
}
