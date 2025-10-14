// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlReallocationTreatyProtocolDAO {
    address public admin;

    struct TreatyEntry {
        string originalProject;
        uint256 originalBudget;
        string reallocationTarget;
        string emotionalTag;
        bool ratified;
    }

    TreatyEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTreaty(string memory _originalProject, uint256 _originalBudget, string memory _reallocationTarget, string memory _emotionalTag) external onlyAdmin {
        protocols.push(TreatyEntry(_originalProject, _originalBudget, _reallocationTarget, _emotionalTag, false));
    }

    function ratifyTreaty(uint256 index) external onlyAdmin {
        protocols[index].ratified = true;
    }

    function getTreaty(uint256 index) external view returns (TreatyEntry memory) {
        return protocols[index];
    }
}
