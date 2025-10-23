// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SukingOutletActivationIndex {
    address public steward;

    struct OutletEntry {
        string location;
        string productType; // "Rice", "Vegetables", "Meat", "Fish"
        string deliveryPartner; // "DA", "LGU", "Coop", "Private"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    OutletEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateOutlet(string memory location, string memory productType, string memory deliveryPartner, string memory emotionalTag) external onlySteward {
        entries.push(OutletEntry(location, productType, deliveryPartner, emotionalTag, true, false));
    }

    function sealOutletEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getOutletEntry(uint256 index) external view returns (OutletEntry memory) {
        return entries[index];
    }
}
