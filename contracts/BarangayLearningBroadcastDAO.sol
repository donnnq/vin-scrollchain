// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayLearningBroadcastDAO {
    address public admin;

    struct BroadcastEntry {
        string barangay;
        string learningMessage;
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

    function submitBroadcast(string memory _barangay, string memory _learningMessage, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_barangay, _learningMessage, _platform, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
