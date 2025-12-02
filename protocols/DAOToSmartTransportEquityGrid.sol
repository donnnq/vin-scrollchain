// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToSmartTransportEquityGrid {
    string public batchID = "1321.9.231";
    string public steward = "Vinvin";

    address public admin;

    struct Transport {
        string system;     // bus rapid transit, e-jeep, bike lanes
        string status;     // equitable, pending, ghost
        uint256 timestamp;
    }

    Transport[] public transports;

    event TransportLogged(string system, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTransport(string memory system, string memory status) public onlyAdmin {
        transports.push(Transport(system, status, block.timestamp));
        emit TransportLogged(system, status);
    }

    function getTransport(uint256 index) public view returns (string memory system, string memory status, uint256 timestamp) {
        Transport memory t = transports[index];
        return (t.system, t.status, t.timestamp);
    }
}
