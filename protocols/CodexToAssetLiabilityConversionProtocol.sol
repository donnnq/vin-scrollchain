// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToAssetLiabilityConversionProtocol {
    string public batchID = "1321.9.105";
    string public steward = "Vinvin";

    address public admin;

    struct Liability {
        bytes32 assetKey;
        uint256 amount;
        string aggressionTag;
        uint256 timestamp;
    }

    mapping(bytes32 => Liability) public liabilityRegistry;

    event AssetConverted(bytes32 indexed assetKey, uint256 amount, string aggressionTag);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function convertAsset(bytes32 assetKey, uint256 amount, string memory aggressionTag) public onlyAdmin {
        liabilityRegistry[assetKey] = Liability(assetKey, amount, aggressionTag, block.timestamp);
        emit AssetConverted(assetKey, amount, aggressionTag);
    }

    function getLiability(bytes32 assetKey) public view returns (uint256 amount, string memory aggressionTag, uint256 timestamp) {
        Liability memory l = liabilityRegistry[assetKey];
        return (l.amount, l.aggressionTag, l.timestamp);
    }
}
