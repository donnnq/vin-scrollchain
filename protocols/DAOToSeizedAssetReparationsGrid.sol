// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToSeizedAssetReparationsGrid {
    string public batchID = "1321.9.102";
    string public steward = "Vinvin";

    address public admin;

    struct Asset {
        uint256 amount;
        string origin;
        bool redirected;
        uint256 timestamp;
    }

    mapping(bytes32 => Asset) public assetRegistry;

    event AssetRedirected(bytes32 indexed key, uint256 amount, string origin);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function redirectAsset(uint256 amount, string memory origin) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(amount, origin, block.timestamp));
        assetRegistry[key] = Asset(amount, origin, true, block.timestamp);
        emit AssetRedirected(key, amount, origin);
    }

    function getAsset(bytes32 key) public view returns (uint256 amount, string memory origin, bool redirected, uint256 timestamp) {
        Asset memory a = assetRegistry[key];
        return (a.amount, a.origin, a.redirected, a.timestamp);
    }
}
