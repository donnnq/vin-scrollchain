// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlReformDAO {
    address public admin;

    struct ReformEntry {
        string projectLabel;
        string reformClause;
        string emotionalTag;
        bool ratified;
    }

    ReformEntry[] public reforms;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitReform(string memory _projectLabel, string memory _reformClause, string memory _emotionalTag) external onlyAdmin {
        reforms.push(ReformEntry(_projectLabel, _reformClause, _emotionalTag, false));
    }

    function ratifyReform(uint256 index) external onlyAdmin {
        reforms[index].ratified = true;
    }

    function getReform(uint256 index) external view returns (ReformEntry memory) {
        return reforms[index];
    }
}
