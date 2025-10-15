// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ComputeGridSovereigntyLedgerDAO {
    address public admin;

    struct GridEntry {
        string region;
        string sovereigntyClause;
        string emotionalTag;
        bool registered;
    }

    GridEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _region, string memory _sovereigntyClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(GridEntry(_region, _sovereigntyClause, _emotionalTag, false));
    }

    function markRegistered(uint256 index) external onlyAdmin {
        ledger[index].registered = true;
    }

    function getEntry(uint256 index) external view returns (GridEntry memory) {
        return ledger[index];
    }
}
