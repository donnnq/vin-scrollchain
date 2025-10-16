// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthReconciliationTribunalPackDAO {
    address public admin;

    struct TribunalEntry {
        string tribunalLabel;
        string reconciliationClause;
        string emotionalTag;
        bool convened;
    }

    TribunalEntry[] public tribunals;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _tribunalLabel, string memory _reconciliationClause, string memory _emotionalTag) external onlyAdmin {
        tribunals.push(TribunalEntry(_tribunalLabel, _reconciliationClause, _emotionalTag, false));
    }

    function conveneEntry(uint256 index) external onlyAdmin {
        tribunals[index].convened = true;
    }

    function getEntry(uint256 index) external view returns (TribunalEntry memory) {
        return tribunals[index];
    }
}
