// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmotionalAPRVaultBroadcastPackDAO {
    address public admin;

    struct BroadcastEntry {
        string vaultLabel;
        string broadcastClause;
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

    function submitEntry(string memory _vaultLabel, string memory _broadcastClause, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_vaultLabel, _broadcastClause, _emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
