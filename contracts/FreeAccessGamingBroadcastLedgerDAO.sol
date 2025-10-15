// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreeAccessGamingBroadcastLedgerDAO {
    address public admin;

    struct BroadcastEntry {
        string nodeLabel;
        string featuredGame;
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

    function submitBroadcast(string memory _nodeLabel, string memory _featuredGame, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_nodeLabel, _featuredGame, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
