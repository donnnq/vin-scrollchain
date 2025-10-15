// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetAmendmentEthicsCodexDAO {
    address public admin;

    struct AmendmentEntry {
        string provisionTitle;
        string ethicsClause;
        string emotionalTag;
        bool enforced;
    }

    AmendmentEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAmendment(string memory _provisionTitle, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(AmendmentEntry(_provisionTitle, _ethicsClause, _emotionalTag, false));
    }

    function enforceAmendment(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getAmendment(uint256 index) external view returns (AmendmentEntry memory) {
        return codex[index];
    }
}
