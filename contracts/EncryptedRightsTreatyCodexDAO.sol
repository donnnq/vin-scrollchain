// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EncryptedRightsTreatyCodexDAO {
    address public admin;

    struct TreatyEntry {
        string rightType;
        string encryptionStandard;
        string treatyClause;
        string emotionalTag;
        bool sealed;
    }

    TreatyEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTreaty(string memory _rightType, string memory _encryptionStandard, string memory _treatyClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(TreatyEntry(_rightType, _encryptionStandard, _treatyClause, _emotionalTag, false));
    }

    function sealTreaty(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getTreaty(uint256 index) external view returns (TreatyEntry memory) {
        return codex[index];
    }
}
