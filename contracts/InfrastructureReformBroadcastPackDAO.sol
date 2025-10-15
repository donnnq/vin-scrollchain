// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureReformBroadcastPackDAO {
    address public admin;

    struct BroadcastEntry {
        string reformLabel;
        string broadcastTheme;
        string platform;
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

    function submitBroadcast(string memory _reformLabel, string memory _broadcastTheme, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_reformLabel, _broadcastTheme, _platform, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
