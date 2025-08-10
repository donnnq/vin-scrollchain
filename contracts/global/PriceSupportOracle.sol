// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title PriceSupportOracle - AI-powered price optimizer and market ally
contract PriceSupportOracle {
    address public oracleKeeper;

    struct Product {
        string name;
        uint256 basePrice;
        uint256 optimizedPrice;
        string marketAdvice;
        bool active;
    }

    mapping(uint256 => Product) public products;
    uint256 public productCount;

    event ProductOptimized(uint256 indexed id, string name, uint256 newPrice, string advice);

    modifier onlyKeeper() {
        require(msg.sender == oracleKeeper, "Not authorized.");
        _;
    }

    constructor() {
        oracleKeeper = msg.sender;
    }

    /// @notice Add product for price optimization
    function addProduct(string memory _name, uint256 _basePrice) external onlyKeeper {
        products[productCount] = Product(_name, _basePrice, _basePrice, "Pending AI advice", true);
        productCount++;
    }

    /// @notice Update optimized price and market advice
    function optimizeProduct(uint256 _id, uint256 _newPrice, string memory _advice) external onlyKeeper {
        require(products[_id].active, "Product inactive.");
        products[_id].optimizedPrice = _newPrice;
        products[_id].marketAdvice = _advice;
        emit ProductOptimized(_id, products[_id].name, _newPrice, _advice);
    }

    /// @notice View product details
    function getProduct(uint256 _id) external view returns (Product memory) {
        return products[_id];
    }
}
