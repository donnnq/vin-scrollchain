// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NativeTreeSovereigntyCodex {
    address public steward;

    struct TreeEntry {
        string speciesName;
        string ecologicalRole;
        string plantingZone;
        string emotionalTag;
    }

    TreeEntry[] public codex;

    event NativeTreeTagged(string speciesName, string ecologicalRole, string plantingZone, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTree(
        string memory speciesName,
        string memory ecologicalRole,
        string memory plantingZone,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(TreeEntry(speciesName, ecologicalRole, plantingZone, emotionalTag));
        emit NativeTreeTagged(speciesName, ecologicalRole, plantingZone, emotionalTag);
    }
}
