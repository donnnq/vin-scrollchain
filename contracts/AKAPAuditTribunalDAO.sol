// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AKAPAuditTribunalDAO {
    address public admin;

    struct AKAPCase {
        string region;
        string beneficiaryGroup;
        string auditFinding;
        bool resolved;
    }

    AKAPCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileCase(string memory _region, string memory _beneficiaryGroup, string memory _auditFinding) external onlyAdmin {
        cases.push(AKAPCase(_region, _beneficiaryGroup, _auditFinding, false));
    }

    function resolveCase(uint256 index) external onlyAdmin {
        cases[index].resolved = true;
    }

    function getCase(uint256 index) external view returns (AKAPCase memory) {
        return cases[index];
    }
}
