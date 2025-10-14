// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PorkSovereigntyBroadcastLedgerDAO {
    address public admin;

    struct BroadcastEntry {
        string speaker;
        string outbreakMessage;
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

    function submitBroadcast(string memory _speaker, string memory _outbreakMessage, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        ledger.push(BroadcastEntry(_speaker, _outbreakMessage, _platform, _emotionalTag, false));
    }

    function archiveBroadcast(uint256 index) external onlyAdmin {
        ledger[index].archived = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return ledger[index];
    }
}
