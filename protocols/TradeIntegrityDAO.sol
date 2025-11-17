// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TradeIntegrityDAO {
    address public validator;

    struct Product {
        string name;
        string origin;
        bool exportable;
        string integrityTag;
        uint256 timestamp;
    }

    Product[] public products;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logProduct(string memory _name, string memory _origin, bool _exportable, string memory _tag) public onlyValidator {
        products.push(Product(_name, _origin, _exportable, _tag, block.timestamp));
    }

    function getProduct(uint256 index) public view returns (Product memory) {
        return products[index];
    }

    function totalProducts() public view returns (uint256) {
        return products.length;
    }
}
