// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiningPermitTransparencyLedger {
    address public steward;

    struct PermitEntry {
        string corporationName;
        string permitIssuer;
        string duration;
        string emotionalTag;
    }

    PermitEntry[] public ledger;

    event MiningPermitTagged(string corporationName, string permitIssuer, string duration, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagPermit(
        string memory corporationName,
        string memory permitIssuer,
        string memory duration,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(PermitEntry(corporationName, permitIssuer, duration, emotionalTag));
        emit MiningPermitTagged(corporationName, permitIssuer, duration, emotionalTag);
    }
}
