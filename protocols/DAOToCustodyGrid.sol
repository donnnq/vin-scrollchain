// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToCustodyGrid {
    string public batchID = "1321.9.129";
    string public steward = "Vinvin";

    address public admin;

    struct Custody {
        string method; // hardware wallet, multi-sig, seed backup
        string description;
        uint256 timestamp;
    }

    Custody[] public custodies;

    event CustodyLogged(string method, string description);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logCustody(string memory method, string memory description) public onlyAdmin {
        custodies.push(Custody(method, description, block.timestamp));
        emit CustodyLogged(method, description);
    }

    function getCustody(uint256 index) public view returns (string memory method, string memory description, uint256 timestamp) {
        Custody memory c = custodies[index];
        return (c.method, c.description, c.timestamp);
    }
}
