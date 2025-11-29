// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToImportsExportsLedger {
    string public batchID = "1321.9.198";
    string public steward = "Vinvin";

    address public admin;

    struct Trade {
        string item;        // electronics, food, textiles
        string origin;      // country of origin
        string status;      // verified, pending, disputed
        uint256 timestamp;
    }

    Trade[] public trades;

    event TradeLogged(string item, string origin, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTrade(string memory item, string memory origin, string memory status) public onlyAdmin {
        trades.push(Trade(item, origin, status, block.timestamp));
        emit TradeLogged(item, origin, status);
    }

    function getTrade(uint256 index) public view returns (string memory item, string memory origin, string memory status, uint256 timestamp) {
        Trade memory t = trades[index];
        return (t.item, t.origin, t.status, t.timestamp);
    }
}
