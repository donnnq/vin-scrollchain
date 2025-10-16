// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentSanctuaryDAO {
    address public admin;

    struct CommentEntry {
        string username;
        string commentText;
        string emotionalTag;
        bool protected;
        bool ritualized;
    }

    CommentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitComment(string memory username, string memory commentText, string memory emotionalTag) external onlyAdmin {
        entries.push(CommentEntry(username, commentText, emotionalTag, false, false));
    }

    function protectComment(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function ritualizeComment(uint256 index) external onlyAdmin {
        entries[index].ritualized = true;
    }

    function getComment(uint256 index) external view returns (CommentEntry memory) {
        return entries[index];
    }
}
