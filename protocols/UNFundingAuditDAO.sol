// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UNFundingAuditDAO {
    address public steward;

    struct DefundEntry {
        string actor;
        string defundTrigger;
        string multilateralTarget;
        string emotionalTag;
    }

    DefundEntry[] public registry;

    event UNFundingTagged(string actor, string defundTrigger, string multilateralTarget, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDefundPush(
        string memory actor,
        string memory defundTrigger,
        string memory multilateralTarget,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(DefundEntry(actor, defundTrigger, multilateralTarget, emotionalTag));
        emit UNFundingTagged(actor, defundTrigger, multilateralTarget, emotionalTag);
    }
}
