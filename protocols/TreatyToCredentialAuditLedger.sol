// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToCredentialAuditLedger {
    string public batchID = "1321.9.220";
    string public steward = "Vinvin";

    address public admin;

    struct Credential {
        string system;      // npm, GitHub, CI/CD
        string status;      // secure, pending, ghost
        uint256 timestamp;
    }

    Credential[] public credentials;

    event CredentialLogged(string system, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logCredential(string memory system, string memory status) public onlyAdmin {
        credentials.push(Credential(system, status, block.timestamp));
        emit CredentialLogged(system, status);
    }

    function getCredential(uint256 index) public view returns (string memory system, string memory status, uint256 timestamp) {
        Credential memory c = credentials[index];
        return (c.system, c.status, c.timestamp);
    }
}
