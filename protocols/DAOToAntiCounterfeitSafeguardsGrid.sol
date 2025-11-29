// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToAntiCounterfeitSafeguardsGrid {
    string public batchID = "1321.9.197";
    string public steward = "Vinvin";

    address public admin;

    struct Product {
        string name;        // jewelry, electronics, clothing
        string origin;      // declared source
        string status;      // authentic, counterfeit, pending
        uint256 timestamp;
    }

    Product[] public products;

    event ProductLogged(string name, string origin, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logProduct(string memory name, string memory origin, string memory status) public onlyAdmin {
        products.push(Product(name, origin, status, block.timestamp));
        emit ProductLogged(name, origin, status);
    }

    function getProduct(uint256 index) public view returns (string memory name, string memory origin, string memory status, uint256 timestamp) {
        Product memory p = products[index];
        return (p.name, p.origin, p.status, p.timestamp);
    }
}
