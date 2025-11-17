// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract IndexFundInfluenceAuditProtocol {
    address public validator;

    struct Influence {
        string fund;
        uint256 assetsUnderManagement;
        string governanceImpact;
        uint256 timestamp;
    }

    Influence[] public audits;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logInfluence(string memory _fund, uint256 _aum, string memory _impact) public onlyValidator {
        audits.push(Influence(_fund, _aum, _impact, block.timestamp));
    }

    function getInfluence(uint256 index) public view returns (Influence memory) {
        return audits[index];
    }

    function totalAudits() public view returns (uint256) {
        return audits.length;
    }
}
