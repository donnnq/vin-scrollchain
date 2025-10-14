// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainSecurityBroadcastDAO {
    address public admin;

    struct BroadcastEntry {
        string breachName;
        string systemAffected;
        string resolutionPath;
        string emotionalTag;
        bool archived;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _breachName, string memory _systemAffected, string memory _resolutionPath, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_breachName, _systemAffected, _resolutionPath, _emotionalTag, false));
    }

    function archiveBroadcast(uint256 index) external onlyAdmin {
        broadcasts[index].archived = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
