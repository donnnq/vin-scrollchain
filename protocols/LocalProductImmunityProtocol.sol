// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LocalProductImmunityProtocol {
    address public admin;

    struct ProductEntry {
        string productName;
        string producer;
        string emotionalTag;
        bool summoned;
        bool exempted;
        bool sealed;
    }

    ProductEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProduct(string memory productName, string memory producer, string memory emotionalTag) external onlyAdmin {
        entries.push(ProductEntry(productName, producer, emotionalTag, true, false, false));
    }

    function exemptProduct(uint256 index) external onlyAdmin {
        entries[index].exempted = true;
    }

    function sealImmunity(uint256 index) external onlyAdmin {
        require(entries[index].exempted, "Must be exempted first");
        entries[index].sealed = true;
    }

    function getProductEntry(uint256 index) external view returns (ProductEntry memory) {
        return entries[index];
    }
}
