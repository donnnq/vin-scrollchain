// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InstitutionalFlowImmunityDAO {
    address public steward;

    struct ImmunityTag {
        string corridor;
        string assetClass;
        string flowType;
        string emotionalTag;
    }

    ImmunityTag[] public registry;

    event FlowImmunityTagged(string corridor, string assetClass, string flowType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagFlowImmunity(
        string memory corridor,
        string memory assetClass,
        string memory flowType,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ImmunityTag(corridor, assetClass, flowType, emotionalTag));
        emit FlowImmunityTagged(corridor, assetClass, flowType, emotionalTag);
    }
}
