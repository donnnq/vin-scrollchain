// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicIntegrityTribunalDAO {
    address public admin;

    struct IntegrityCase {
        string officialName;
        string allegation;
        string verdict;
        bool resolved;
    }

    IntegrityCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileCase(string memory _officialName, string memory _allegation, string memory _verdict) external onlyAdmin {
        cases.push(IntegrityCase(_officialName, _allegation, _verdict, false));
    }

    function resolveCase(uint256 index) external onlyAdmin {
        cases[index].resolved = true;
    }

    function getCase(uint256 index) external view returns (IntegrityCase memory) {
        return cases[index];
    }
}
