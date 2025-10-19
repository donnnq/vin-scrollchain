// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AFPAssetDispositionDAO {
    address public admin;

    struct AFPEntry {
        string assetName;
        string baseLocation;
        string dispositionType;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    AFPEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAFPAsset(string memory assetName, string memory baseLocation, string memory dispositionType, string memory emotionalTag) external onlyAdmin {
        entries.push(AFPEntry(assetName, baseLocation, dispositionType, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealAFPEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getAFPEntry(uint256 index) external view returns (AFPEntry memory) {
        return entries[index];
    }
}
