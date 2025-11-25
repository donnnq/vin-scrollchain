// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToMerchantLiberationGrid {
    string public batchID = "1321.9.119";
    string public steward = "Vinvin";

    address public admin;

    struct Merchant {
        string name;
        uint256 feeBurden;
        uint256 timestamp;
        bool liberated;
    }

    mapping(bytes32 => Merchant) public merchants;

    event MerchantLiberated(bytes32 indexed key, string name, uint256 feeBurden);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function liberateMerchant(string memory name, uint256 feeBurden) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(name, feeBurden, block.timestamp));
        merchants[key] = Merchant(name, feeBurden, block.timestamp, true);
        emit MerchantLiberated(key, name, feeBurden);
    }

    function getMerchant(bytes32 key) public view returns (string memory name, uint256 feeBurden, uint256 timestamp, bool liberated) {
        Merchant memory m = merchants[key];
        return (m.name, m.feeBurden, m.timestamp, m.liberated);
    }
}
