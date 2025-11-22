// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToGlobalDisclosureStandardsProtocol {
    string public batchID = "1321.9.108";
    string public steward = "Vinvin";

    address public admin;

    struct Standard {
        string category;
        string requirement;
        uint256 timestamp;
    }

    Standard[] public standards;

    event StandardCodified(string category, string requirement);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function codifyStandard(string memory category, string memory requirement) public onlyAdmin {
        standards.push(Standard(category, requirement, block.timestamp));
        emit StandardCodified(category, requirement);
    }

    function getStandard(uint256 index) public view returns (string memory category, string memory requirement, uint256 timestamp) {
        Standard memory s = standards[index];
        return (s.category, s.requirement, s.timestamp);
    }
}
