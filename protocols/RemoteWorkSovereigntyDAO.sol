// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RemoteWorkSovereigntyDAO {
    address public steward;

    struct SovereigntyEntry {
        string workerName;
        string barangay;
        string remoteRole;
        string emotionalTag;
    }

    SovereigntyEntry[] public registry;

    event RemoteWorkTagged(string workerName, string barangay, string remoteRole, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagRemoteWork(
        string memory workerName,
        string memory barangay,
        string memory remoteRole,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SovereigntyEntry(workerName, barangay, remoteRole, emotionalTag));
        emit RemoteWorkTagged(workerName, barangay, remoteRole, emotionalTag);
    }
}
