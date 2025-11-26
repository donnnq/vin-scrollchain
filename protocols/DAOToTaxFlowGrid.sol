// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToTaxFlowGrid {
    string public batchID = "1321.9.142";
    string public steward = "Vinvin";

    address public admin;

    struct TaxFlow {
        string authority; // e.g. BIR, new agency
        string instrument; // LOA, audit order
        uint256 count;
        uint256 timestamp;
    }

    TaxFlow[] public flows;

    event TaxLogged(string authority, string instrument, uint256 count);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTax(string memory authority, string memory instrument, uint256 count) public onlyAdmin {
        flows.push(TaxFlow(authority, instrument, count, block.timestamp));
        emit TaxLogged(authority, instrument, count);
    }

    function getTax(uint256 index) public view returns (string memory authority, string memory instrument, uint256 count, uint256 timestamp) {
        TaxFlow memory t = flows[index];
        return (t.authority, t.instrument, t.count, t.timestamp);
    }
}
