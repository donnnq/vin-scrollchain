// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BitcoinBroadcastImmunityLedgerDAO {
    address public admin;

    struct BroadcastEntry {
        string speaker;
        string broadcastType;
        string immunityClause;
        string emotionalTag;
        bool verified;
    }

    BroadcastEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _speaker, string memory _broadcastType, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(BroadcastEntry(_speaker, _broadcastType, _immunityClause, _emotionalTag, false));
    }

    function verifyBroadcast(uint256 index) external onlyAdmin {
        ledger[index].verified = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return ledger[index];
    }
}
