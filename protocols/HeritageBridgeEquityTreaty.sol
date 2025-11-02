// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageBridgeEquityTreaty {
    address public steward;

    struct BridgeClause {
        string bridgeName;
        string corridor;
        string equityAction;
        string emotionalTag;
    }

    BridgeClause[] public treatyLog;

    event BridgeEquityTagged(string bridgeName, string corridor, string equityAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagBridgeEquity(
        string memory bridgeName,
        string memory corridor,
        string memory equityAction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(BridgeClause(bridgeName, corridor, equityAction, emotionalTag));
        emit BridgeEquityTagged(bridgeName, corridor, equityAction, emotionalTag);
    }
}
