// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ParkSanctumUpgradeCodex {
    address public steward;

    struct UpgradeClause {
        string parkName;
        string upgradeType;
        string civicOutcome;
        string emotionalTag;
    }

    UpgradeClause[] public codex;

    event UpgradeLogged(string parkName, string upgradeType, string civicOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logUpgrade(
        string memory parkName,
        string memory upgradeType,
        string memory civicOutcome,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(UpgradeClause(parkName, upgradeType, civicOutcome, emotionalTag));
        emit UpgradeLogged(parkName, upgradeType, civicOutcome, emotionalTag);
    }
}
