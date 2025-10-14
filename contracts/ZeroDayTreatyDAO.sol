// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZeroDayTreatyDAO {
    address public admin;

    struct TreatyEntry {
        string exploitName;
        string affectedSystem;
        string containmentClause;
        string emotionalTag;
        bool ratified;
    }

    TreatyEntry[] public treaties;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTreaty(string memory _exploitName, string memory _affectedSystem, string memory _containmentClause, string memory _emotionalTag) external onlyAdmin {
        treaties.push(TreatyEntry(_exploitName, _affectedSystem, _containmentClause, _emotionalTag, false));
    }

    function ratifyTreaty(uint256 index) external onlyAdmin {
        treaties[index].ratified = true;
    }

    function getTreaty(uint256 index) external view returns (TreatyEntry memory) {
        return treaties[index];
    }
}
