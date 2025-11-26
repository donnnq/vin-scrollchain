// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToCustodyGrid {
    string public batchID = "1321.9.133";
    string public steward = "Vinvin";

    address public admin;

    struct Custody {
        string entity; // e.g. MicroStrategy
        string method; // hardware wallet, multi-sig, treasury vault
        uint256 amount;
        uint256 timestamp;
    }

    Custody[] public custodies;

    event CustodyLogged(string entity, string method, uint256 amount);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logCustody(string memory entity, string memory method, uint256 amount) public onlyAdmin {
        custodies.push(Custody(entity, method, amount, block.timestamp));
        emit CustodyLogged(entity, method, amount);
    }

    function getCustody(uint256 index) public view returns (string memory entity, string memory method, uint256 amount, uint256 timestamp) {
        Custody memory c = custodies[index];
        return (c.entity, c.method, c.amount, c.timestamp);
    }
}
