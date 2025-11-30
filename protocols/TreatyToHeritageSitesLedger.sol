// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToHeritageSitesLedger {
    string public batchID = "1321.9.201";
    string public steward = "Vinvin";

    address public admin;

    struct Site {
        string location;    // church, temple, ancestral house
        string status;      // protected, pending, audited
        uint256 timestamp;
    }

    Site[] public sites;

    event SiteLogged(string location, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSite(string memory location, string memory status) public onlyAdmin {
        sites.push(Site(location, status, block.timestamp));
        emit SiteLogged(location, status);
    }

    function getSite(uint256 index) public view returns (string memory location, string memory status, uint256 timestamp) {
        Site memory s = sites[index];
        return (s.location, s.status, s.timestamp);
    }
}
