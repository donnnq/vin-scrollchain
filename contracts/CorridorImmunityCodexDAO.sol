// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CorridorImmunityCodexDAO {
    address public admin;

    struct ImmunityClause {
        string corridorName;
        string riskType;
        string immunityProtocol;
        string emotionalTag;
        bool deployed;
    }

    ImmunityClause[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClause(string memory _corridorName, string memory _riskType, string memory _immunityProtocol, string memory _emotionalTag) external onlyAdmin {
        codex.push(ImmunityClause(_corridorName, _riskType, _immunityProtocol, _emotionalTag, false));
    }

    function deployClause(uint256 index) external onlyAdmin {
        codex[index].deployed = true;
    }

    function getClause(uint256 index) external view returns (ImmunityClause memory) {
        return codex[index];
    }
}
