// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokTeacherBroadcastCodexDAO {
    address public admin;

    struct BroadcastEntry {
        string teacherName;
        string purok;
        string message;
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

    function submitBroadcast(string memory _teacherName, string memory _purok, string memory _message, string memory _emotionalTag) external onlyAdmin {
        codex.push(BroadcastEntry(_teacherName, _purok, _message, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        codex[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return codex[index];
    }
}
