// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicAssetRepatriationDAO {
    address public steward;

    struct RepatriationEntry {
        string assetName;
        string originCountry;
        string repatriationStatus;
        string emotionalTag;
    }

    RepatriationEntry[] public registry;

    event AssetRepatriated(string assetName, string originCountry, string repatriationStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function repatriateAsset(
        string memory assetName,
        string memory originCountry,
        string memory repatriationStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(RepatriationEntry(assetName, originCountry, repatriationStatus, emotionalTag));
        emit AssetRepatriated(assetName, originCountry, repatriationStatus, emotionalTag);
    }
}
