// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CongressionalIssueResolutionPackDAO {
    address public admin;

    struct ResolutionEntry {
        string issueLabel;
        string resolutionClause;
        string emotionalTag;
        bool resolved;
    }

    ResolutionEntry[] public resolutions;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitResolution(string memory _issueLabel, string memory _resolutionClause, string memory _emotionalTag) external onlyAdmin {
        resolutions.push(ResolutionEntry(_issueLabel, _resolutionClause, _emotionalTag, false));
    }

    function markResolved(uint256 index) external onlyAdmin {
        resolutions[index].resolved = true;
    }

    function getResolution(uint256 index) external view returns (ResolutionEntry memory) {
        return resolutions[index];
    }
}
