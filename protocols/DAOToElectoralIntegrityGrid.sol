// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToElectoralIntegrityGrid {
    string public batchID = "1321.9.113";
    string public steward = "Vinvin";

    address public admin;

    struct Election {
        string electionName;
        uint256 timestamp;
        bool audited;
    }

    mapping(bytes32 => Election) public elections;

    event ElectionLogged(bytes32 indexed key, string electionName);
    event ElectionAudited(bytes32 indexed key, bool audited);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logElection(string memory electionName) public onlyAdmin returns (bytes32 key) {
        key = keccak256(abi.encodePacked(electionName, block.timestamp));
        elections[key] = Election(electionName, block.timestamp, false);
        emit ElectionLogged(key, electionName);
    }

    function auditElection(bytes32 key, bool status) public onlyAdmin {
        elections[key].audited = status;
        emit ElectionAudited(key, status);
    }

    function getElection(bytes32 key) public view returns (string memory electionName, uint256 timestamp, bool audited) {
        Election memory e = elections[key];
        return (e.electionName, e.timestamp, e.audited);
    }
}
