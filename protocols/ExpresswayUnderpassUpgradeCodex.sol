// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExpresswayUnderpassUpgradeCodex {
    address public steward;

    struct UpgradeEntry {
        string location;
        string proposedUse;
        string upgradeFeatures;
        string emotionalTag;
    }

    UpgradeEntry[] public codex;

    event UnderpassUpgradeTagged(string location, string proposedUse, string upgradeFeatures, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagUpgrade(
        string memory location,
        string memory proposedUse,
        string memory upgradeFeatures,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(UpgradeEntry(location, proposedUse, upgradeFeatures, emotionalTag));
        emit UnderpassUpgradeTagged(location, proposedUse, upgradeFeatures, emotionalTag);
    }
}
