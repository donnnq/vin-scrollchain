// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WFHMealReimbursementCodexDAO {
    address public admin;

    struct ReimbursementEntry {
        string workerLabel;
        string reimbursementClause;
        string emotionalTag;
        bool sealed;
    }

    ReimbursementEntry[] public reimbursements;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerLabel, string memory _reimbursementClause, string memory _emotionalTag) external onlyAdmin {
        reimbursements.push(ReimbursementEntry(_workerLabel, _reimbursementClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        reimbursements[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (ReimbursementEntry memory) {
        return reimbursements[index];
    }
}
