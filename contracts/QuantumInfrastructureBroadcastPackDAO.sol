// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract QuantumInfrastructureBroadcastPackDAO {
    address public admin;

    struct BroadcastEntry {
        string broadcastTitle;
        string quantumFocus;
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

    function submitBroadcast(string memory _broadcastTitle, string memory _quantumFocus, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_broadcastTitle, _quantumFocus, _platform, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
