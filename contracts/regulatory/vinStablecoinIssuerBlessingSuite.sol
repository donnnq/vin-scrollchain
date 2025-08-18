// SPDX-License-Identifier: Mythic-Scrollsmith-License
pragma solidity ^0.8.0;

/// @title vinStablecoinIssuerBlessingSuite.sol
/// @author Vinvin
/// @notice Ritualizes stablecoin issuer integrity, verifies license status, and tracks civic blessings

contract vinStablecoinIssuerBlessingSuite {
    address public steward;

    struct Issuer {
        string name;
        bool hasLicense;
        bool isBlessed;
        uint256 civicScore;
    }

    mapping(address => Issuer) public issuers;

    event IssuerRegistered(address indexed issuer, string name, bool hasLicense);
    event IssuerBlessed(address indexed issuer, uint256 civicScore);

    constructor() {
        steward = msg.sender;
    }

    function registerIssuer(address _issuer, string memory _name, bool _hasLicense) public {
        issuers[_issuer] = Issuer(_name, _hasLicense, false, 0);
        emit IssuerRegistered(_issuer, _name, _hasLicense);
    }

    function blessIssuer(address _issuer, uint256 _civicScore) public {
        Issuer storage issuer = issuers[_issuer];
        require(issuer.hasLicense, "Issuer must be licensed.");
        require(!issuer.isBlessed, "Already blessed.");

        issuer.isBlessed = true;
        issuer.civicScore = _civicScore;
        emit IssuerBlessed(_issuer, _civicScore);
    }

    function getIssuerStatus(address _issuer) public view returns (Issuer memory) {
        return issuers[_issuer];
    }
}
