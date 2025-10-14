// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KarmicJailTimeCodexDAO {
    address public admin;

    struct Sentence {
        string accusedEntity;
        string violationType;
        string karmicDuration;
        string emotionalTag;
        bool enforced;
    }

    Sentence[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function assignSentence(string memory _accusedEntity, string memory _violationType, string memory _karmicDuration, string memory _emotionalTag) external onlyAdmin {
        codex.push(Sentence(_accusedEntity, _violationType, _karmicDuration, _emotionalTag, false));
    }

    function enforceSentence(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getSentence(uint256 index) external view returns (Sentence memory) {
        return codex[index];
    }
}
