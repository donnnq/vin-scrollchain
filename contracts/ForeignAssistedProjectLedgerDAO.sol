// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForeignAssistedProjectLedgerDAO {
    address public admin;

    struct LedgerEntry {
        string projectName;
        string donorCountry;
        string oversightProtocol;
        string emotionalTag;
        bool verified;
    }

    LedgerEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _projectName, string memory _donorCountry, string memory _oversightProtocol, string memory _emotionalTag) external onlyAdmin {
        ledger.push(LedgerEntry(_projectName, _donorCountry, _oversightProtocol, _emotionalTag, false));
    }

    function verifyEntry(uint256 index) external onlyAdmin {
        ledger[index].verified = true;
    }

    function getEntry(uint256 index) external view returns (LedgerEntry memory) {
        return ledger[index];
    }
}
