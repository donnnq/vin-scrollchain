// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayEducationBroadcastCodexDAO {
    address public admin;

    struct BroadcastEntry {
        string barangay;
        string educationMessage;
        string platform;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _barangay, string memory _educationMessage, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        codex.push(BroadcastEntry(_barangay, _educationMessage, _platform, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        codex[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return codex[index];
    }
}
