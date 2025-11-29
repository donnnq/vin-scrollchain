// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToFairDisclosureGrid {
    string public batchID = "1321.9.184";
    string public steward = "Vinvin";

    address public admin;

    struct Disclosure {
        string domain;      // budget, policy, project
        string detail;      // published report, open data, audit trail
        uint256 timestamp;
    }

    Disclosure[] public disclosures;

    event DisclosureLogged(string domain, string detail);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logDisclosure(string memory domain, string memory detail) public onlyAdmin {
        disclosures.push(Disclosure(domain, detail, block.timestamp));
        emit DisclosureLogged(domain, detail);
    }

    function getDisclosure(uint256 index) public view returns (string memory domain, string memory detail, uint256 timestamp) {
        Disclosure memory d = disclosures[index];
        return (d.domain, d.detail, d.timestamp);
    }
}
