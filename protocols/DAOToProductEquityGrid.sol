// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToProductEquityGrid {
    string public batchID = "1321.9.240";
    string public steward = "Vinvin";

    address public admin;

    struct Product {
        string item;       // food, electronics, toys
        string status;     // equitable, pending, ghost
        uint256 timestamp;
    }

    Product[] public products;

    event ProductLogged(string item, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logProduct(string memory item, string memory status) public onlyAdmin {
        products.push(Product(item, status, block.timestamp));
        emit ProductLogged(item, status);
    }

    function getProduct(uint256 index) public view returns (string memory item, string memory status, uint256 timestamp) {
        Product memory p = products[index];
        return (p.item, p.status, p.timestamp);
    }
}
