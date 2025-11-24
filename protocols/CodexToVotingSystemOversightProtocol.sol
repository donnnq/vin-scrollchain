// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToVotingSystemOversightProtocol {
    string public batchID = "1321.9.113";
    string public steward = "Vinvin";

    address public admin;

    struct Oversight {
        string system;
        string finding;
        uint256 timestamp;
    }

    Oversight[] public records;

    event OversightLogged(string system, string finding);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logOversight(string memory system, string memory finding) public onlyAdmin {
        records.push(Oversight(system, finding, block.timestamp));
        emit OversightLogged(system, finding);
    }

    function getOversight(uint256 index) public view returns (string memory system, string memory finding, uint256 timestamp) {
        Oversight memory o = records[index];
        return (o.system, o.finding, o.timestamp);
    }
}
