// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BroadcastImmunityLedgerDAO {
    address public admin;

    struct BroadcastEntry {
        string messageTitle;
        string originPlatform;
        string immunityClause;
        string emotionalTag;
        bool protected;
    }

    BroadcastEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logBroadcast(string memory _messageTitle, string memory _originPlatform, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(BroadcastEntry(_messageTitle, _originPlatform, _immunityClause, _emotionalTag, false));
    }

    function protectBroadcast(uint256 index) external onlyAdmin {
        ledger[index].protected = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return ledger[index];
    }
}
