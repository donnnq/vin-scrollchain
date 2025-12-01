// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToNutritionSupplyAuditLedger {
    string public batchID = "1321.9.215";
    string public steward = "Vinvin";

    address public admin;

    struct Supply {
        string product;     // rice, milk, fish
        string source;      // local, imported
        string status;      // audited, pending, ghost
        uint256 timestamp;
    }

    Supply[] public supplies;

    event SupplyLogged(string product, string source, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSupply(string memory product, string memory source, string memory status) public onlyAdmin {
        supplies.push(Supply(product, source, status, block.timestamp));
        emit SupplyLogged(product, source, status);
    }

    function getSupply(uint256 index) public view returns (string memory product, string memory source, string memory status, uint256 timestamp) {
        Supply memory s = supplies[index];
        return (s.product, s.source, s.status, s.timestamp);
    }
}
