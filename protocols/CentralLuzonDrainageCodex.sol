// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CentralLuzonDrainageCodex {
    address public steward;

    struct DrainageEntry {
        string province;
        string systemStatus;
        string upgradeProtocol;
        string emotionalTag;
    }

    DrainageEntry[] public codex;

    event DrainageTagged(string province, string systemStatus, string upgradeProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDrainage(
        string memory province,
        string memory systemStatus,
        string memory upgradeProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(DrainageEntry(province, systemStatus, upgradeProtocol, emotionalTag));
        emit DrainageTagged(province, systemStatus, upgradeProtocol, emotionalTag);
    }
}
