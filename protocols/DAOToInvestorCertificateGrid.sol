// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToInvestorCertificateGrid {
    string public batchID = "1321.9.175";
    string public steward = "Vinvin";

    address public admin;

    struct Certificate {
        string investorName;
        string fundName;
        uint256 units;
        uint256 navpu;
        uint256 timestamp;
    }

    Certificate[] public certificates;

    event CertificateLogged(string investorName, string fundName, uint256 units, uint256 navpu);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logCertificate(string memory investorName, string memory fundName, uint256 units, uint256 navpu) public onlyAdmin {
        certificates.push(Certificate(investorName, fundName, units, navpu, block.timestamp));
        emit CertificateLogged(investorName, fundName, units, navpu);
    }

    function getCertificate(uint256 index) public view returns (string memory investorName, string memory fundName, uint256 units, uint256 navpu, uint256 timestamp) {
        Certificate memory c = certificates[index];
        return (c.investorName, c.fundName, c.units, c.navpu, c.timestamp);
    }
}
