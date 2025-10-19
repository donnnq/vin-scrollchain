// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DummyAssetDetectionDAO {
    address public admin;

    struct DummyEntry {
        string officialName;
        string assetType;
        string dummyHolder;
        string emotionalTag;
        bool summoned;
        bool detected;
        bool sealed;
    }

    DummyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDummy(string memory officialName, string memory assetType, string memory dummyHolder, string memory emotionalTag) external onlyAdmin {
        entries.push(DummyEntry(officialName, assetType, dummyHolder, emotionalTag, true, false, false));
    }

    function confirmDetection(uint256 index) external onlyAdmin {
        entries[index].detected = true;
    }

    function sealDummy(uint256 index) external onlyAdmin {
        require(entries[index].detected, "Must be detected first");
        entries[index].sealed = true;
    }

    function getDummyEntry(uint256 index) external view returns (DummyEntry memory) {
        return entries[index];
    }
}
