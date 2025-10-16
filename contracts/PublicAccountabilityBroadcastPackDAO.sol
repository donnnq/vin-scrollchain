// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicAccountabilityBroadcastPackDAO {
    address public admin;

    struct BroadcastEntry {
        string broadcastLabel;
        string accountabilityClause;
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

    function submitEntry(string memory _broadcastLabel, string memory _accountabilityClause, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_broadcastLabel, _accountabilityClause, _emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
