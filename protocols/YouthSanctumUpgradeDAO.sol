// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthSanctumUpgradeDAO {
    address public steward;

    struct UpgradeEntry {
        string sanctumID;
        string upgradeType;
        string corridor;
        string emotionalTag;
    }

    UpgradeEntry[] public upgradeLog;

    event SanctumUpgraded(string sanctumID, string upgradeType, string corridor, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function upgradeSanctum(
        string memory sanctumID,
        string memory upgradeType,
        string memory corridor,
        string memory emotionalTag
    ) public onlySteward {
        upgradeLog.push(UpgradeEntry(sanctumID, upgradeType, corridor, emotionalTag));
        emit SanctumUpgraded(sanctumID, upgradeType, corridor, emotionalTag);
    }
}
