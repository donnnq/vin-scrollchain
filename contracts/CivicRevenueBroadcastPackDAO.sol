// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicRevenueBroadcastPackDAO {
    address public admin;

    struct BroadcastEntry {
        string corridorLabel;
        string revenueClause;
        string emotionalTag;
        bool published;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _corridorLabel, string memory _revenueClause, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_corridorLabel, _revenueClause, _emotionalTag, false));
    }

    function publishEntry(uint256 index) external onlyAdmin {
        broadcasts[index].published = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
