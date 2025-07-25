// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinStablecoinComplianceRouter {
    struct StablecoinMetadata {
        string name;
        address issuer;
        bool geniusCertified;
        bool auditVerified;
        uint256 reserveRatio; // in basis points
        uint256 auraScore;    // 0-100 scale
    }

    mapping(address => StablecoinMetadata) public stablecoinIndex;
    address public scrollkeeper;

    event StablecoinTagged(address indexed token, string name, bool geniusCertified, uint256 auraScore);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not scrollkeeper");
        _;
    }

    constructor(address _scrollkeeper) {
        scrollkeeper = _scrollkeeper;
    }

    function tagStablecoin(
        address token,
        string memory name,
        bool geniusCertified,
        bool auditVerified,
        uint256 reserveRatio,
        uint256 auraScore
    ) external onlyScrollkeeper {
        require(reserveRatio >= 10000, "Reserve ratio below 100%");
        stablecoinIndex[token] = StablecoinMetadata(name, token, geniusCertified, auditVerified, reserveRatio, auraScore);
        emit StablecoinTagged(token, name, geniusCertified, auraScore);
    }

    function isGENIUSCompliant(address token) external view returns (bool) {
        StablecoinMetadata memory meta = stablecoinIndex[token];
        return meta.geniusCertified && meta.auditVerified && meta.reserveRatio >= 10000;
    }

    function getAuraScore(address token) external view returns (uint256) {
        return stablecoinIndex[token].auraScore;
    }
}
