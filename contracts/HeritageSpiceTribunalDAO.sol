// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageSpiceTribunalDAO {
    address public admin;

    struct SpiceCase {
        string spice;
        string origin;
        string violation;
        string verdict;
        bool resolved;
    }

    SpiceCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileCase(string memory _spice, string memory _origin, string memory _violation, string memory _verdict) external onlyAdmin {
        cases.push(SpiceCase(_spice, _origin, _violation, _verdict, false));
    }

    function resolveCase(uint256 index) external onlyAdmin {
        cases[index].resolved = true;
    }

    function getCase(uint256 index) external view returns (SpiceCase memory) {
        return cases[index];
    }
}
