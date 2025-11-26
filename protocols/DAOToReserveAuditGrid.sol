// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToReserveAuditGrid {
    string public batchID = "1321.9.125";
    string public steward = "Vinvin";

    address public admin;

    struct ReserveAudit {
        string issuer;
        string asset;
        uint256 amount;
        uint256 timestamp;
    }

    ReserveAudit[] public audits;

    event ReserveLogged(string issuer, string asset, uint256 amount);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logReserve(string memory issuer, string memory asset, uint256 amount) public onlyAdmin {
        audits.push(ReserveAudit(issuer, asset, amount, block.timestamp));
        emit ReserveLogged(issuer, asset, amount);
    }

    function getReserve(uint256 index) public view returns (string memory issuer, string memory asset, uint256 amount, uint256 timestamp) {
        ReserveAudit memory r = audits[index];
        return (r.issuer, r.asset, r.amount, r.timestamp);
    }
}
