// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodSRPRestorationDAO {
    address public admin;

    struct Product {
        string name;
        uint256 originalSRP;
        uint256 currentPrice;
        bool compliant;
    }

    Product[] public products;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerProduct(string memory _name, uint256 _originalSRP, uint256 _currentPrice) external onlyAdmin {
        bool isCompliant = _currentPrice <= (_originalSRP + (_originalSRP / 10)); // max 10% markup
        products.push(Product(_name, _originalSRP, _currentPrice, isCompliant));
    }

    function updatePrice(uint256 index, uint256 _newPrice) external onlyAdmin {
        Product storage p = products[index];
        p.currentPrice = _newPrice;
        p.compliant = _newPrice <= (p.originalSRP + (p.originalSRP / 10));
    }

    function getProduct(uint256 index) external view returns (Product memory) {
        return products[index];
    }
}
