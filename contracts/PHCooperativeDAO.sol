// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PHCooperativeDAO {
    address public admin;

    struct CoopEntry {
        string coopLabel;
        string equityClause;
        string emotionalTag;
        bool registered;
    }

    CoopEntry[] public cooperatives;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _coopLabel, string memory _equityClause, string memory _emotionalTag) external onlyAdmin {
        cooperatives.push(CoopEntry(_coopLabel, _equityClause, _emotionalTag, false));
    }

    function registerEntry(uint256 index) external onlyAdmin {
        cooperatives[index].registered = true;
    }

    function getEntry(uint256 index) external view returns (CoopEntry memory) {
        return cooperatives[index];
    }
}
