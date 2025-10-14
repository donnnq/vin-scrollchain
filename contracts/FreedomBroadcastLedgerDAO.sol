// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreedomBroadcastLedgerDAO {
    address public admin;

    struct BroadcastEntry {
        string speaker;
        string message;
        string platform;
        string emotionalTag;
        bool archived;
    }

    BroadcastEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _speaker, string memory _message, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        ledger.push(BroadcastEntry(_speaker, _message, _platform, _emotionalTag, false));
    }

    function archiveBroadcast(uint256 index) external onlyAdmin {
        ledger[index].archived = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return ledger[index];
    }
}
