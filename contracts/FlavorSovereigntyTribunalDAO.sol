// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FlavorSovereigntyTribunalDAO {
    address public admin;

    struct TribunalCase {
        string dish;
        string violation;
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

    function fileCase(string memory _dish, string memory _violation, string memory _verdict) external onlyAdmin {
        cases.push(TribunalCase(_dish, _violation, _verdict, false));
    }

    function resolveCase(uint256 index) external onlyAdmin {
        cases[index].resolved = true;
    }

    function getCase(uint256 index) external view returns (TribunalCase memory) {
        return cases[index];
    }
}
