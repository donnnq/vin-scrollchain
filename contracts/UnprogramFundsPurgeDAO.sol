// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnprogramFundsPurgeDAO {
    address public admin;

    struct PurgeEntry {
        string fundLabel;
        string purgeReason;
        string emotionalTag;
        bool removed;
    }

    PurgeEntry[] public purgedFunds;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitPurge(string memory _fundLabel, string memory _purgeReason, string memory _emotionalTag) external onlyAdmin {
        purgedFunds.push(PurgeEntry(_fundLabel, _purgeReason, _emotionalTag, false));
    }

    function markRemoved(uint256 index) external onlyAdmin {
        purgedFunds[index].removed = true;
    }

    function getPurge(uint256 index) external view returns (PurgeEntry memory) {
        return purgedFunds[index];
    }
}
