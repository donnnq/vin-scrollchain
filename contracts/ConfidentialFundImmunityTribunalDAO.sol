// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConfidentialFundImmunityTribunalDAO {
    address public admin;

    struct TribunalCase {
        string agency;
        string fundPurpose;
        string auditFinding;
        bool immunityGranted;
    }

    TribunalCase[] public cases;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileCase(string memory _agency, string memory _fundPurpose, string memory _auditFinding) external onlyAdmin {
        cases.push(TribunalCase(_agency, _fundPurpose, _auditFinding, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        cases[index].immunityGranted = true;
    }

    function getCase(uint256 index) external view returns (TribunalCase memory) {
        return cases[index];
    }
}
