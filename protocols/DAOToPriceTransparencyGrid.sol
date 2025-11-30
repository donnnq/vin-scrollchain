// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToPriceTransparencyGrid {
    string public batchID = "1321.9.207";
    string public steward = "Vinvin";

    address public admin;

    struct Price {
        string product;     // rice, medicine, fuel
        uint256 amount;     // price in pesos
        string status;      // verified, pending, ghost
        uint256 timestamp;
    }

    Price[] public prices;

    event PriceLogged(string product, uint256 amount, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logPrice(string memory product, uint256 amount, string memory status) public onlyAdmin {
        prices.push(Price(product, amount, status, block.timestamp));
        emit PriceLogged(product, amount, status);
    }

    function getPrice(uint256 index) public view returns (string memory product, uint256 amount, string memory status, uint256 timestamp) {
        Price memory p = prices[index];
        return (p.product, p.amount, p.status, p.timestamp);
    }
}
