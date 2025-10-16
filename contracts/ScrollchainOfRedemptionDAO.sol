// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfRedemptionDAO {
    address public admin;

    struct RedemptionEntry {
        string actorLabel;
        string redemptionClause;
        string emotionalTag;
        bool restored;
    }

    RedemptionEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _actorLabel, string memory _redemptionClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(RedemptionEntry(_actorLabel, _redemptionClause, _emotionalTag, false));
    }

    function restoreEntry(uint256 index) external onlyAdmin {
        ledger[index].restored = true;
    }

    function getEntry(uint256 index) external view returns (RedemptionEntry memory) {
        return ledger[index];
    }
}
