// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RemittanceTreatyCodexDAO {
    address public admin;

    struct Treaty {
        string treatyName;
        string remittanceCorridor;
        string protectionClause;
        string emotionalTag;
        bool ratified;
    }

    Treaty[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTreaty(string memory _treatyName, string memory _remittanceCorridor, string memory _protectionClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(Treaty(_treatyName, _remittanceCorridor, _protectionClause, _emotionalTag, false));
    }

    function ratifyTreaty(uint256 index) external onlyAdmin {
        codex[index].ratified = true;
    }

    function getTreaty(uint256 index) external view returns (Treaty memory) {
        return codex[index];
    }
}
