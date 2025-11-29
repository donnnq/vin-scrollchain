// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToRightsEquityGrid {
    string public batchID = "1321.9.189";
    string public steward = "Vinvin";

    address public admin;

    struct RightsAudit {
        string domain;      // labor, education, health, housing
        string status;      // equitable, pending, violated
        uint256 timestamp;
    }

    RightsAudit[] public audits;

    event RightsLogged(string domain, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logRights(string memory domain, string memory status) public onlyAdmin {
        audits.push(RightsAudit(domain, status, block.timestamp));
        emit RightsLogged(domain, status);
    }

    function getRights(uint256 index) public view returns (string memory domain, string memory status, uint256 timestamp) {
        RightsAudit memory r = audits[index];
        return (r.domain, r.status, r.timestamp);
    }
}
