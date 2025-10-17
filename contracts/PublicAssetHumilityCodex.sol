// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicAssetHumilityCodex {
    address public admin;

    struct AssetEntry {
        string projectName;
        string department;
        string emotionalTag;
        bool logoOnly;
        bool egoFree;
    }

    AssetEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logAsset(string memory projectName, string memory department, string memory emotionalTag) external onlyAdmin {
        entries.push(AssetEntry(projectName, department, emotionalTag, true, true));
    }

    function getAsset(uint256 index) external view returns (AssetEntry memory) {
        return entries[index];
    }
}
