// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayProductionDAO {
    address public steward;

    struct ProductionEntry {
        string barangay;
        string productType;
        string laborPartner;
        string emotionalTag;
    }

    ProductionEntry[] public registry;

    event ProductionLogged(string barangay, string productType, string laborPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logProduction(
        string memory barangay,
        string memory productType,
        string memory laborPartner,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ProductionEntry(barangay, productType, laborPartner, emotionalTag));
        emit ProductionLogged(barangay, productType, laborPartner, emotionalTag);
    }
}
