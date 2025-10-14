// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditFestivalOfMercyDAO {
    address public admin;

    struct Audit {
        string corridor;
        string ritual;
        bool completed;
    }

    Audit[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory _corridor, string memory _ritual) external onlyAdmin {
        audits.push(Audit(_corridor, _ritual, false));
    }

    function markCompleted(uint256 index) external onlyAdmin {
        audits[index].completed = true;
    }

    function getAudit(uint256 index) external view returns (Audit memory) {
        return audits[index];
    }
}
