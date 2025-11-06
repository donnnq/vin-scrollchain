// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RoadsideShadeMandateCodex {
    address public steward;

    struct ShadeMandate {
        string roadType;
        string location;
        string treeRequirement;
        string emotionalTag;
    }

    ShadeMandate[] public codex;

    event ShadeMandateTagged(string roadType, string location, string treeRequirement, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagMandate(
        string memory roadType,
        string memory location,
        string memory treeRequirement,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ShadeMandate(roadType, location, treeRequirement, emotionalTag));
        emit ShadeMandateTagged(roadType, location, treeRequirement, emotionalTag);
    }
}
