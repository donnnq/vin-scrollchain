// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToRenewableAccessGrid {
    string public batchID = "1321.9.208";
    string public steward = "Vinvin";

    address public admin;

    struct Access {
        string community;   // rural, urban, coastal
        string source;      // solar, wind, hydro
        string status;      // equitable, pending, audited
        uint256 timestamp;
    }

    Access[] public accesses;

    event AccessLogged(string community, string source, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAccess(string memory community, string memory source, string memory status) public onlyAdmin {
        accesses.push(Access(community, source, status, block.timestamp));
        emit AccessLogged(community, source, status);
    }

    function getAccess(uint256 index) public view returns (string memory community, string memory source, string memory status, uint256 timestamp) {
        Access memory a = accesses[index];
        return (a.community, a.source, a.status, a.timestamp);
    }
}
