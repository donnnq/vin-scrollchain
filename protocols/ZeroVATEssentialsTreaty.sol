// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZeroVATEssentialsTreaty {
    address public steward;

    struct EssentialItem {
        string itemName;
        string category;
        string exemptionStatus;
        string emotionalTag;
    }

    EssentialItem[] public registry;

    event VATExempted(string itemName, string category, string exemptionStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function exemptItem(
        string memory itemName,
        string memory category,
        string memory exemptionStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EssentialItem(itemName, category, exemptionStatus, emotionalTag));
        emit VATExempted(itemName, category, exemptionStatus, emotionalTag);
    }
}
