// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToTraditionPreservationGrid {
    string public batchID = "1321.9.201";
    string public steward = "Vinvin";

    address public admin;

    struct Tradition {
        string name;        // weaving, dance, oral history
        string status;      // preserved, endangered, audited
        uint256 timestamp;
    }

    Tradition[] public traditions;

    event TraditionLogged(string name, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTradition(string memory name, string memory status) public onlyAdmin {
        traditions.push(Tradition(name, status, block.timestamp));
        emit TraditionLogged(name, status);
    }

    function getTradition(uint256 index) public view returns (string memory name, string memory status, uint256 timestamp) {
        Tradition memory t = traditions[index];
        return (t.name, t.status, t.timestamp);
    }
}
