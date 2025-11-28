// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToTransparencyLedger {
    string public batchID = "1321.9.165";
    string public steward = "Vinvin";

    address public admin;

    struct TransparencyRecord {
        string entity;
        string outcome;   // clean, irregularities, sanctions
        uint256 timestamp;
    }

    TransparencyRecord[] public records;

    event TransparencyLogged(string entity, string outcome);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTransparency(string memory entity, string memory outcome) public onlyAdmin {
        records.push(TransparencyRecord(entity, outcome, block.timestamp));
        emit TransparencyLogged(entity, outcome);
    }

    function getTransparency(uint256 index) public view returns (string memory entity, string memory outcome, uint256 timestamp) {
        TransparencyRecord memory r = records[index];
        return (r.entity, r.outcome, r.timestamp);
    }
}
