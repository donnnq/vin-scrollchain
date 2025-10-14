// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CurrencyRiskImmunityCodexDAO {
    address public admin;

    struct ImmunityProtocol {
        string currency;
        string riskType;
        string mitigationStrategy;
        string emotionalTag;
        bool deployed;
    }

    ImmunityProtocol[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _currency, string memory _riskType, string memory _mitigationStrategy, string memory _emotionalTag) external onlyAdmin {
        codex.push(ImmunityProtocol(_currency, _riskType, _mitigationStrategy, _emotionalTag, false));
    }

    function deployProtocol(uint256 index) external onlyAdmin {
        codex[index].deployed = true;
    }

    function getProtocol(uint256 index) external view returns (ImmunityProtocol memory) {
        return codex[index];
    }
}
