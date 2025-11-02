// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShippingSovereigntyDAO {
    address public steward;

    struct ShippingEntry {
        string corridor;
        string carrierName;
        string sovereigntyConcern;
        string emotionalTag;
    }

    ShippingEntry[] public registry;

    event ShippingTagged(string corridor, string carrierName, string sovereigntyConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagShipping(
        string memory corridor,
        string memory carrierName,
        string memory sovereigntyConcern,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ShippingEntry(corridor, carrierName, sovereigntyConcern, emotionalTag));
        emit ShippingTagged(corridor, carrierName, sovereigntyConcern, emotionalTag);
    }
}
