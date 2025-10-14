// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayTribunalLedgerDAO {
    address public admin;

    struct TribunalCase {
        string barangay;
        string accusedEntity;
        string violation;
        string emotionalTag;
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

    function fileCase(string memory _barangay, string memory _accusedEntity, string memory _violation, string memory _emotionalTag) external onlyAdmin {
        cases.push(TribunalCase(_barangay, _accusedEntity, _violation, _emotionalTag, false));
    }

    function markResolved(uint256 index) external onlyAdmin {
        cases[index].resolved = true;
    }

    function getCase(uint256 index) external view returns (TribunalCase memory) {
        return cases[index];
    }
}
