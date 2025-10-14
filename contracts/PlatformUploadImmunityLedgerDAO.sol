// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlatformUploadImmunityLedgerDAO {
    address public admin;

    struct UploadEntry {
        string platform;
        string contentType;
        string immunityClause;
        string emotionalTag;
        bool logged;
    }

    UploadEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _platform, string memory _contentType, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(UploadEntry(_platform, _contentType, _immunityClause, _emotionalTag, false));
    }

    function logEntry(uint256 index) external onlyAdmin {
        ledger[index].logged = true;
    }

    function getEntry(uint256 index) external view returns (UploadEntry memory) {
        return ledger[index];
    }
}
