// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToTransportEquityGrid {
    string public batchID = "1321.9.193";
    string public steward = "Vinvin";

    address public admin;

    struct TransportAudit {
        string mode;        // bus, jeepney, train, bike
        string status;      // equitable, pending, audited
        uint256 timestamp;
    }

    TransportAudit[] public audits;

    event TransportLogged(string mode, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTransport(string memory mode, string memory status) public onlyAdmin {
        audits.push(TransportAudit(mode, status, block.timestamp));
        emit TransportLogged(mode, status);
    }

    function getTransport(uint256 index) public view returns (string memory mode, string memory status, uint256 timestamp) {
        TransportAudit memory t = audits[index];
        return (t.mode, t.status, t.timestamp);
    }
}
