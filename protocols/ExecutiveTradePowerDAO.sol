// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExecutiveTradePowerDAO {
    address public steward;

    struct PowerEntry {
        string rulingBody;
        string tradeAction;
        string authorityBasis;
        string emotionalTag;
    }

    PowerEntry[] public registry;

    event ExecutiveTradePowerBroadcasted(string rulingBody, string tradeAction, string authorityBasis, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastPower(
        string memory rulingBody,
        string memory tradeAction,
        string memory authorityBasis,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(PowerEntry(rulingBody, tradeAction, authorityBasis, emotionalTag));
        emit ExecutiveTradePowerBroadcasted(rulingBody, tradeAction, authorityBasis, emotionalTag);
    }
}
