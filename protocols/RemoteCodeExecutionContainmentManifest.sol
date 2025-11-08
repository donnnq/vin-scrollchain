// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RemoteCodeExecutionContainmentManifest {
    address public steward;

    struct ContainmentEntry {
        string timestamp;
        string extensionName;
        string patchVersion;
        string userProtectionAction;
        string emotionalTag;
    }

    ContainmentEntry[] public manifest;

    event RCEContained(string timestamp, string extensionName, string patchVersion, string userProtectionAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containRCE(
        string memory timestamp,
        string memory extensionName,
        string memory patchVersion,
        string memory userProtectionAction,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(ContainmentEntry(timestamp, extensionName, patchVersion, userProtectionAction, emotionalTag));
        emit RCEContained(timestamp, extensionName, patchVersion, userProtectionAction, emotionalTag);
    }
}
