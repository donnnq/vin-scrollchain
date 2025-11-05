// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrossBorderEnforcementDAO {
    address public steward;

    struct EnforcementEntry {
        string borderRegion;
        string enforcementAction;
        string cooperationProtocol;
        string emotionalTag;
    }

    EnforcementEntry[] public registry;

    event CrossBorderEnforcementTagged(string borderRegion, string enforcementAction, string cooperationProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEnforcement(
        string memory borderRegion,
        string memory enforcementAction,
        string memory cooperationProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EnforcementEntry(borderRegion, enforcementAction, cooperationProtocol, emotionalTag));
        emit CrossBorderEnforcementTagged(borderRegion, enforcementAction, cooperationProtocol, emotionalTag);
    }
}
