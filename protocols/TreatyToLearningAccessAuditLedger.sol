// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToLearningAccessAuditLedger {
    string public batchID = "1321.9.211";
    string public steward = "Vinvin";

    address public admin;

    struct Access {
        string community;   // rural, urban, coastal
        string resource;    // books, internet, classroom
        string status;      // equitable, pending, ghost
        uint256 timestamp;
    }

    Access[] public accesses;

    event AccessLogged(string community, string resource, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAccess(string memory community, string memory resource, string memory status) public onlyAdmin {
        accesses.push(Access(community, resource, status, block.timestamp));
        emit AccessLogged(community, resource, status);
    }

    function getAccess(uint256 index) public view returns (string memory community, string memory resource, string memory status, uint256 timestamp) {
        Access memory a = accesses[index];
        return (a.community, a.resource, a.status, a.timestamp);
    }
}
