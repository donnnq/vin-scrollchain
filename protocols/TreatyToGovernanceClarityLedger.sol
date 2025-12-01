// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToGovernanceClarityLedger {
    string public batchID = "1321.9.218";
    string public steward = "Vinvin";

    address public admin;

    struct Governance {
        string agency;      // DOH, DepEd, DOTR
        string report;      // audit summary
        string status;      // transparent, pending, ghost
        uint256 timestamp;
    }

    Governance[] public governanceReports;

    event GovernanceLogged(string agency, string report, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logGovernance(string memory agency, string memory report, string memory status) public onlyAdmin {
        governanceReports.push(Governance(agency, report, status, block.timestamp));
        emit GovernanceLogged(agency, report, status);
    }

    function getGovernance(uint256 index) public view returns (string memory agency, string memory report, string memory status, uint256 timestamp) {
        Governance memory g = governanceReports[index];
        return (g.agency, g.report, g.status, g.timestamp);
    }
}
