// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalSupplyChainSovereigntyDAO {
    address public steward;

    struct SovereigntyTag {
        string corridor;
        string supplyChainNode;
        string sovereigntyLevel;
        string emotionalTag;
    }

    SovereigntyTag[] public registry;

    event SovereigntyTagged(string corridor, string supplyChainNode, string sovereigntyLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagSovereignty(
        string memory corridor,
        string memory supplyChainNode,
        string memory sovereigntyLevel,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SovereigntyTag(corridor, supplyChainNode, sovereigntyLevel, emotionalTag));
        emit SovereigntyTagged(corridor, supplyChainNode, sovereigntyLevel, emotionalTag);
    }
}
