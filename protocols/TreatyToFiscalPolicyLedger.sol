// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToFiscalPolicyLedger {
    string public batchID = "1321.9.188";
    string public steward = "Vinvin";

    address public admin;

    struct Policy {
        string measure;     // taxation, subsidy, spending
        string impact;      // equitable, regressive, progressive
        uint256 timestamp;
    }

    Policy[] public policies;

    event PolicyLogged(string measure, string impact);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logPolicy(string memory measure, string memory impact) public onlyAdmin {
        policies.push(Policy(measure, impact, block.timestamp));
        emit PolicyLogged(measure, impact);
    }

    function getPolicy(uint256 index) public view returns (string memory measure, string memory impact, uint256 timestamp) {
        Policy memory p = policies[index];
        return (p.measure, p.impact, p.timestamp);
    }
}
