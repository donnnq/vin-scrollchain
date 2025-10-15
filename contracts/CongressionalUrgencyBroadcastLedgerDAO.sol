// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CongressionalUrgencyBroadcastLedgerDAO {
    address public admin;

    struct BroadcastEntry {
        string billLabel;
        string urgencyClause;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _billLabel, string memory _urgencyClause, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_billLabel, _urgencyClause, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
