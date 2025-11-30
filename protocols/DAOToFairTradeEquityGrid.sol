// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToFairTradeEquityGrid {
    string public batchID = "1321.9.210";
    string public steward = "Vinvin";

    address public admin;

    struct Trade {
        string product;     // coffee, electronics, textiles
        string origin;      // country of origin
        string status;      // fair, pending, ghost
        uint256 timestamp;
    }

    Trade[] public trades;

    event TradeLogged(string product, string origin, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTrade(string memory product, string memory origin, string memory status) public onlyAdmin {
        trades.push(Trade(product, origin, status, block.timestamp));
        emit TradeLogged(product, origin, status);
    }

    function getTrade(uint256 index) public view returns (string memory product, string memory origin, string memory status, uint256 timestamp) {
        Trade memory t = trades[index];
        return (t.product, t.origin, t.status, t.timestamp);
    }
}
