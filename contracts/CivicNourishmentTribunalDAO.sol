// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicNourishmentTribunalDAO {
    address public admin;

    struct TribunalCase {
        string community;
        string foodIssue;
        string verdict;
        bool resolved;
    }

    TribunalCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileCase(string memory _community, string memory _foodIssue, string memory _verdict) external onlyAdmin {
        cases.push(TribunalCase(_community, _foodIssue, _verdict, false));
    }

    function resolveCase(uint256 index) external onlyAdmin {
        cases[index].resolved = true;
    }

    function getCase(uint256 index) external view returns (TribunalCase memory) {
        return cases[index];
    }
}
