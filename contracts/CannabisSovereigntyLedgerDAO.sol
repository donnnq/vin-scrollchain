// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CannabisSovereigntyLedgerDAO {
    address public admin;

    struct SovereigntyEntry {
        string companyName;
        string regulatoryStatus;
        string sovereigntyClause;
        string emotionalTag;
        bool verified;
    }

    SovereigntyEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _companyName, string memory _regulatoryStatus, string memory _sovereigntyClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(SovereigntyEntry(_companyName, _regulatoryStatus, _sovereigntyClause, _emotionalTag, false));
    }

    function verifyEntry(uint256 index) external onlyAdmin {
        ledger[index].verified = true;
    }

    function getEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return ledger[index];
    }
}
