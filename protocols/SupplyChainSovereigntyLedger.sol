// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChainSovereigntyLedger {
    address public steward;

    struct UpgradeEntry {
        string region;
        string logisticsNode;
        string upgradeProtocol;
        string emotionalTag;
    }

    UpgradeEntry[] public ledger;

    event SupplyChainUpgradeTagged(string region, string logisticsNode, string upgradeProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagUpgrade(
        string memory region,
        string memory logisticsNode,
        string memory upgradeProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(UpgradeEntry(region, logisticsNode, upgradeProtocol, emotionalTag));
        emit SupplyChainUpgradeTagged(region, logisticsNode, upgradeProtocol, emotionalTag);
    }
}
