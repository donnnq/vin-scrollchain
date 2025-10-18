// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LocalProductSovereigntyDAO {
    address public admin;

    struct ProductEntry {
        string productName;
        string creator;
        string originBarangay;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool recognized;
    }

    ProductEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProduct(string memory productName, string memory creator, string memory originBarangay, string memory emotionalTag) external onlyAdmin {
        entries.push(ProductEntry(productName, creator, originBarangay, emotionalTag, true, false, false));
    }

    function verifyProduct(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function recognizeProduct(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].recognized = true;
    }

    function getProductEntry(uint256 index) external view returns (ProductEntry memory) {
        return entries[index];
    }
}
