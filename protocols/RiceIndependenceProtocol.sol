// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiceIndependenceProtocol {
    address public steward;

    struct RiceAsset {
        string barangay;
        uint256 hectares;
        uint256 estimatedYield;
        string storageFacility;
        bool isOrganic;
    }

    RiceAsset[] public riceAssets;

    event RiceAssetRegistered(string barangay, uint256 hectares, uint256 estimatedYield, string storageFacility, bool isOrganic);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function registerRiceAsset(
        string memory barangay,
        uint256 hectares,
        uint256 estimatedYield,
        string memory storageFacility,
        bool isOrganic
    ) public onlySteward {
        riceAssets.push(RiceAsset(barangay, hectares, estimatedYield, storageFacility, isOrganic));
        emit RiceAssetRegistered(barangay, hectares, estimatedYield, storageFacility, isOrganic);
    }
}
